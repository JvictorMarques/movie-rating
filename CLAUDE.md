# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository layout

```
movie-rating/
├── app/                # FastAPI application (source, tests, migrations)
├── k8s/                # Kubernetes manifests (Helm chart + ArgoCD App of Apps)
├── docker/             # OTel Collector, Grafana, Mimir, Tempo, Loki configs
├── terraform/          # AWS infrastructure modules (VPC, ECR, RDS, SSM, EKS)
├── scripts/
│   ├── app/            # load_test.py, latency_sim.py — manual testing utilities
│   └── k8s/cluster/    # setup.sh — automated kind cluster bootstrap
├── docs/images/        # Project assets (logo.svg)
├── compose.yaml        # Root orchestration — includes app/ and docker/ composes
├── CHANGELOG.md
└── .pre-commit-config.yaml
```

All application work happens inside `app/`. All taskipy and uv commands must be run from `app/`.

## Commands

All tasks are run via `taskipy` using `uv run` **from the `app/` directory**:

```bash
uv run task lint          # ruff check
uv run task lint_fix      # ruff check --fix
uv run task format        # ruff format (runs lint_fix after)
uv run task mypy          # mypy src/
uv run task test_check    # pytest -s -x -vv (no coverage)
uv run task test          # pytest -s -x --cov=src/ -vv (generates coverage HTML)
uv run task app           # fastapi dev app.py (runs lint_fix, format, mypy, test_check, starts postgres via ../compose.yaml, applies migrations)
uv run task docs          # mkdocs serve -a 127.0.0.1:8001
```

Run a single test file:
```bash
uv run pytest tests/path/to/test_file.py -s -x -vv
```

The `pre_app` hook runs `docker compose -f ../compose.yaml up -d postgres --wait && alembic upgrade head` — it targets the root `compose.yaml`, not `app/compose.yaml`.

To bring up the full stack (app + observability) run from the repo root:
```bash
docker compose up -d
```

## Architecture

The app is a FastAPI REST API (`app/app.py`) with routes mounted at `/api/v1/<resource>`. It uses async SQLAlchemy with PostgreSQL in production and SQLite in-memory for tests.

**Layer structure** (each resource follows this pattern):
- `src/routers/` — FastAPI route handlers; inject `AsyncSession` via `Depends(get_session)`
- `src/services/` — business logic; raise `HTTPException` for domain errors; call repository functions; emit structured log messages (WARNING for conflicts/403s, INFO for mutations, DEBUG for lookups)
- `src/repositories/` — raw SQLAlchemy queries; no HTTP concerns
- `src/schemas/` — Pydantic models for request/response validation; `common.py` holds shared type aliases (`Age`, `Name`, `Rating`)
- `src/models/` — SQLAlchemy ORM models; all inherit from `src/models/base.py`
- `src/core/` — `database.py` (engine + session factory), `settings.py` (env-based config via pydantic-settings), `security.py` (password hashing + JWT encode/decode), `constants.py` (shared error message strings), `telemetry.py` (OTel SDK setup), `metrics.py` (OTel instruments), `middleware.py` (HTTP metrics middleware)

**Data model overview:**
- `User` ↔ `Movie` via `UserMovie` (many-to-many with `rating` field)
- `Movie` ↔ `Actor` via `MovieActor` (many-to-many)
- Passwords are hashed with `pwdlib[argon2]`; stored as `str`, exposed as `SecretStr` in schemas

**Authentication** uses JWT (PyJWT). `src/core/security.py` handles token creation/verification and password hashing. `src/services/auth.py` exposes `get_current_user` (FastAPI dependency) and `verify_user_ownership`. Routes that mutate user data (`PUT`/`DELETE /api/v1/users/{id}`) and rating endpoints require a `Bearer` token. The `src/routers/auth.py` router provides `POST /token` and `POST /refresh_token`.

**Settings** are read from `app/.env` with these required vars: `DB_USER`, `DB_PASSWORD`, `DB_DATABASE`, `DB_ADDRESS`, `DB_PORT`, `JWT_SECRET_KEY`. Optional: `ENVIRONMENT` (default `development` — controls log level: DEBUG in development, INFO otherwise), `JWT_ALGORITHM` (default `HS256`), `JWT_ACCESS_TOKEN_EXPIRE_MINUTES` (default `15`), `OTLP_ENDPOINT` (default `None` — if not set, `setup_telemetry` is not called and the app runs without telemetry).

**Tests** use `pytest-asyncio` with an in-memory SQLite engine. The `session` fixture creates/drops tables per test; the `client` fixture overrides `get_session` dependency via `app.dependency_overrides`. Tests live in `app/tests/`, fixtures in `app/tests/conftest.py`.

**Migrations** are managed with Alembic (`app/alembic.ini`).

A `/health` GET endpoint is defined directly in `app/app.py` (not under `/api/v1`).

## Kubernetes

Config files live in `k8s/`. Deployments are managed via ArgoCD (GitOps) using the App of Apps pattern — no Helmfile.

```
k8s/
├── env/
│   ├── local/                        # Local (kind) environment
│   │   ├── main.yaml                 # ArgoCD App of Apps — bootstraps the cluster
│   │   ├── setup/kind-config.yaml    # kind cluster config (1 control-plane + 3 workers, ports 80/443)
│   │   ├── argo/
│   │   │   ├── apps.yaml             # ApplicationSet — all infra releases
│   │   │   └── movie-rating.yaml     # ArgoCD Application for the app chart
│   │   └── values/                   # Helm values per release (argocd, kong, goldilocks, obs stack)
│   └── aws/                          # AWS (EKS) environment
│       ├── main.yaml                 # ArgoCD App of Apps — bootstraps the AWS cluster
│       ├── argo/                     # apps.yaml + movie-rating.yaml
│       └── values/                   # Helm values per release (argocd, LBC, autoscaler, ESO, movie-rating)
└── helm/charts/movie-rating/         # Application Helm chart
    ├── Chart.yaml                    # postgresql bitnami dependency (condition: local.enabled)
    ├── values.yaml                   # Default values (resources, image refs, secretStore, otlp, ingress)
    └── templates/
        ├── _helpers.tpl
        ├── app.yaml                  # Deployment, Service, Ingress; Secret (local) or ExternalSecret (AWS)
        ├── migrations.yaml           # pre-upgrade Job; Secret (local) or ExternalSecret (AWS)
        ├── secret-store.yaml         # SecretStore for AWS SSM Parameter Store (AWS only)
        └── NOTES.txt
```

**Releases managed by ArgoCD ApplicationSet** (`k8s/env/local/argo/apps.yaml`):

- `argocd` — self-managed ArgoCD (namespace `argocd`)
- `kong` — Kong ingress controller (namespace `kong`)
- `goldilocks` — VPA resource recommender (namespace `goldilocks`); namespace `movie-rating` is labelled `goldilocks.fairwinds.com/enabled=true`
- `mimir`, `tempo`, `loki`, `otel-collector`, `otel-collector-node`, `grafana` — observability stack (namespace `observability`)
- `movie-rating` — the app chart (namespace `movie-rating`); defined in `k8s/env/local/argo/movie-rating.yaml`

**Helm chart details:**

- PostgreSQL is included as a bitnami dependency and only deployed when `local.enabled: true`
- Secrets are provisioned as Kubernetes `Secret` (local) or `ExternalSecret` from AWS SSM Parameter Store (AWS), then injected via `envFrom.secretRef` in both the Deployment and the migration Job
- `image.tag` holds the image repository name; `image.version` holds the tag — supports both local names (`movie-rating`) and ECR URIs
- `migrations.yaml` runs as a `pre-upgrade` Helm hook Job; it uses the `movie-rating-migrations` image whose ENTRYPOINT runs `alembic upgrade head` directly
- The migration Job only runs on `helm upgrade`, not on `helm install`
- To override image versions per environment, add `helm.valuesObject` to the ArgoCD Application manifest (`k8s/env/local/argo/movie-rating.yaml`)

**Local setup (kind) — automated:**

```bash
bash scripts/k8s/cluster/setup.sh --create-cluster   # create + deploy everything
bash scripts/k8s/cluster/setup.sh --delete-cluster   # destroy cluster
```

Requires: `kind`, `helm`, `kubectl`, `docker` on `$PATH`.

**Local setup (kind) — manual:**

```bash
kind create cluster --config k8s/env/local/setup/kind-config.yaml

docker build --target runtime -t movie-rating:latest app/
docker build --target migrations -t movie-rating-migrations:latest app/
kind load docker-image movie-rating:latest
kind load docker-image movie-rating-migrations:latest

helm upgrade --install --create-namespace --namespace argocd argocd argo/argo-cd \
  --version 9.5.15 -f k8s/env/local/values/argocd.yaml
kubectl apply -f k8s/env/local/main.yaml

# Add to /etc/hosts: 127.0.0.1 movie-rating.local.com
```

## Observability

Config files live in `docker/` with one subdirectory per component:

```
docker/
├── compose.yaml
├── grafana/
│   ├── datasources.yaml       # Grafana datasource provisioning
│   ├── dashboards.yaml        # Grafana dashboard provisioning pointer
│   └── dashboards/
│       ├── metrics.json       # HTTP + DB pool metrics dashboard
│       └── logs.json          # Structured logs dashboard (tabbed: Errors/Warnings/Info)
├── loki/loki.yaml
├── mimir/mimir.yaml
├── otel/collector.yaml        # OTLP receiver + hostmetrics scraper
└── tempo/tempo.yaml
```

The app exports traces, metrics, and structured logs via OTLP gRPC to the collector. `src/core/middleware.py` records `http_request` (counter) and `http_request_duration` (histogram) per route/method/status.

## Code style

- Ruff with `line-length = 79`, single quotes, preview mode
- `select = ['I', 'F', 'E', 'W', 'PL', 'PT']`; ignored: `PLR2004`, `PLR0917`, `PLR0913`
- mypy with `pydantic.mypy` plugin; check `src/` only
- pre-commit hooks at repo root: trailing whitespace, EOF fixer, YAML check, large-file check, ruff lint+format, hadolint (Dockerfile), mypy, pytest, terraform fmt/validate/tflint/docs, shellcheck (`scripts/`)


## README badges

The `<div align="center">` block contains only the logo and italic description. Badges follow immediately after, outside the div, on two lines:

- **Line 1** — all tech badges in this order: Python, FastAPI, SQLAlchemy, Pydantic, PostgreSQL, OpenTelemetry, Docker, Grafana, Kubernetes, Helm, Terraform, pre-commit
- **Line 2** — License, Version (dynamic from `pyproject.toml`) — always last
