# Movie Rating API

<div align="center">
  <img src="docs/images/logo.svg" alt="Movie Rating" width="100%"/>
  <br/>
  <em>A REST API for managing and rating movies, built with FastAPI and async SQLAlchemy. Users can register, movies can be created with a cast of actors, and each user can rate any movie on a scale from 0 to 10.</em>
</div>

---
![Python](https://img.shields.io/badge/Python-3.13%2B-blue?logo=data:image/svg%2Bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSIxMTAiIGhlaWdodD0iMTEwIiB2aWV3Qm94PSIwLjIxIC0wLjA3NyAxMTAgMTEwIj48bGluZWFyR3JhZGllbnQgaWQ9ImEiIHgxPSI2My44MTYiIHgyPSIxMTguNDkzIiB5MT0iNTYuNjgzIiB5Mj0iMS44MjMiIGdyYWRpZW50VHJhbnNmb3JtPSJtYXRyaXgoMSAwIDAgLTEgLTUzLjI5NyA2Ni40MzIpIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHN0b3Agb2Zmc2V0PSIwIiBzdHlsZT0ic3RvcC1jb2xvcjojMzg3ZWI4Ii8+PHN0b3Agb2Zmc2V0PSIxIiBzdHlsZT0ic3RvcC1jb2xvcjojMzY2OTk0Ii8+PC9saW5lYXJHcmFkaWVudD48cGF0aCBmaWxsPSJ1cmwoI2EpIiBkPSJNNTUuMDIzLS4wNzdjLTI1Ljk3MSAwLTI2LjI1IDEwLjA4MS0yNi4yNSAxMi4xNTZ2MTIuNTk0aDI2Ljc1djMuNzgxSDE4LjE0OEMxMC4xOTkgMjguNDU0LjIxIDMzLjI4Ny4yMSA1NC43MDRjMCAxOS42NzMgNy43OTIgMjcuMjgxIDE1LjY1NiAyNy4yODFoOS4zNDRWNjguODZjMC01LjQ5MSAyLjcyMS0xNS42NTYgMTUuNDA2LTE1LjY1NmgyNi41MzFjMy45MDIgMCAxNC45MDYtMS42OTYgMTQuOTA2LTE0LjQwNlYxNC41NzljLjAwMS0zLjE1My0uNTM4LTE0LjY1Ni0yNy4wMy0xNC42NTZtLTE0Ljc1IDguNDY5YTQuODA3IDQuODA3IDAgMCAxIDQuODEzIDQuODEzYzAgMi42NjEtMi4xNTEgNC44MTMtNC44MTMgNC44MTNzLTQuODEzLTIuMTUxLTQuODEzLTQuODEzYTQuODA3IDQuODA3IDAgMCAxIDQuODEzLTQuODEzIi8+PGxpbmVhckdyYWRpZW50IGlkPSJiIiB4MT0iOTcuMDQ0IiB4Mj0iMTU1LjY2NyIgeTE9IjIxLjYzMiIgeTI9Ii0zNC41MzEiIGdyYWRpZW50VHJhbnNmb3JtPSJtYXRyaXgoMSAwIDAgLTEgLTUzLjI5NyA2Ni40MzIpIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+PHN0b3Agb2Zmc2V0PSIwIiBzdHlsZT0ic3RvcC1jb2xvcjojZmZlMDUyIi8+PHN0b3Agb2Zmc2V0PSIxIiBzdHlsZT0ic3RvcC1jb2xvcjojZmZjMzMxIi8+PC9saW5lYXJHcmFkaWVudD48cGF0aCBmaWxsPSJ1cmwoI2IpIiBkPSJNNTUuMzk3IDEwOS45MjNjMjUuOTU5IDAgMjYuMjgyLTEwLjI3MSAyNi4yODItMTIuMTU2Vjg1LjE3M0g1NC44OTd2LTMuNzgxaDM3LjM3NWM4LjAwOSAwIDE3LjkzOC00Ljk1NCAxNy45MzgtMjYuMjUgMC0yMy4zMjItMTAuNTM4LTI3LjI4MS0xNS42NTYtMjcuMjgxSDg1LjIxdjEzLjEyNWMwIDUuNDkxLTIuNjMxIDE1LjY1Ni0xNS40MDYgMTUuNjU2SDQzLjI3MmMtMy44OTIgMC0xNC45MDYgMS44OTYtMTQuOTA2IDE0LjQwNnYyNC4yMTljMCA1LjIzIDMuMTk2IDE0LjY1NiAyNy4wMzEgMTQuNjU2bTE0Ljc1MS04LjQ2OWMtMi42NjIgMC00LjgxMy0yLjE1MS00LjgxMy00LjgxM3MyLjE1LTQuODEzIDQuODEzLTQuODEzYzIuNjYxIDAgNC44MTMgMi4xNTEgNC44MTMgNC44MTNzLTIuMTUyIDQuODEzLTQuODEzIDQuODEzIi8+PC9zdmc+) ![FastAPI](https://img.shields.io/badge/FastAPI-0.135%2B-009688?logo=fastapi&logoColor=009688) ![SQLAlchemy](https://img.shields.io/badge/SQLAlchemy-2.0-D71F00?logo=sqlalchemy&logoColor=D71F00) ![Pydantic](https://img.shields.io/badge/Pydantic-2.0-E92063?logo=pydantic&logoColor=E92063) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-17-336791?logo=postgresql&logoColor=336791) ![OpenTelemetry](https://img.shields.io/badge/OpenTelemetry-1.41.1-425CC7?logo=data:image/svg%2Bxml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHJvbGU9ImltZyIgdmlld0JveD0iLTEyLjcwIC0xMi43MCAxMDI0LjQwIDEwMjQuNDAiPjxzdHlsZT5zdmcge2VuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgMTAwMCAxMDAwfTwvc3R5bGU+PHBhdGggZmlsbD0iI2Y1YTgwMCIgZD0iTTUyOC43IDU0NS45Yy00MiA0Mi00MiAxMTAuMSAwIDE1Mi4xczExMC4xIDQyIDE1Mi4xIDAgNDItMTEwLjEgMC0xNTIuMS0xMTAuMS00Mi0xNTIuMSAwem0xMTMuNyAxMTMuOGMtMjAuOCAyMC44LTU0LjUgMjAuOC03NS4zIDAtMjAuOC0yMC44LTIwLjgtNTQuNSAwLTc1LjMgMjAuOC0yMC44IDU0LjUtMjAuOCA3NS4zIDAgMjAuOCAyMC43IDIwLjggNTQuNSAwIDc1LjN6bTM2LjYtNjQzbC02NS45IDY1LjljLTEyLjkgMTIuOS0xMi45IDM0LjEgMCA0N2wyNTcuMyAyNTcuM2MxMi45IDEyLjkgMzQuMSAxMi45IDQ3IDBsNjUuOS02NS45YzEyLjktMTIuOSAxMi45LTM0LjEgMC00N0w3MjUuOSAxNi43Yy0xMi45LTEyLjktMzQtMTIuOS00Ni45IDB6TTIxNy4zIDg1OC44YzExLjctMTEuNyAxMS43LTMwLjggMC00Mi41bC0zMy41LTMzLjVjLTExLjctMTEuNy0zMC44LTExLjctNDIuNSAwTDcyLjEgODUybC0uMS4xLTE5LTE5Yy0xMC41LTEwLjUtMjcuNi0xMC41LTM4IDAtMTAuNSAxMC41LTEwLjUgMjcuNiAwIDM4bDExNCAxMTRjMTAuNSAxMC41IDI3LjYgMTAuNSAzOCAwczEwLjUtMjcuNiAwLTM4bC0xOS0xOSAuMS0uMSA2OS4yLTY5LjJ6Ii8+PHBhdGggZmlsbD0iIzQyNWNjNyIgZD0iTTU2NS45IDIwNS45TDQxOS41IDM1Mi4zYy0xMyAxMy0xMyAzNC40IDAgNDcuNGw5MC40IDkwLjRjNjMuOS00NiAxNTMuNS00MC4zIDIxMSAxNy4ybDczLjItNzMuMmMxMy0xMyAxMy0zNC40IDAtNDcuNEw2MTMuMyAyMDUuOWMtMTMtMTMuMS0zNC40LTEzLjEtNDcuNCAwem0tOTQgMzIyLjNsLTUzLjQtNTMuNGMtMTIuNS0xMi41LTMzLTEyLjUtNDUuNSAwTDE4NC43IDY2My4yYy0xMi41IDEyLjUtMTIuNSAzMyAwIDQ1LjVsMTA2LjcgMTA2LjdjMTIuNSAxMi41IDMzIDEyLjUgNDUuNSAwTDQ1OCA2OTQuMWMtMjUuNi01Mi45LTIxLTExNi44IDEzLjktMTY1Ljl6Ii8+PC9zdmc+) ![Docker](https://img.shields.io/badge/Docker-27+-2496ED?logo=docker&logoColor=2496ED) ![Grafana](https://img.shields.io/badge/Grafana-12+-F46800?logo=grafana&logoColor=F46800) ![Kubernetes](https://img.shields.io/badge/Kubernetes-1.35-326CE5?logo=kubernetes&logoColor=326CE5) ![Helm](https://img.shields.io/badge/Helm-4.2.0-0F1689?logo=helm&logoColor=0F1689) ![Terraform](https://img.shields.io/badge/Terraform-1.15+-844FBA?logo=terraform&logoColor=844FBA) ![pre-commit](https://img.shields.io/badge/pre--commit-4.5.1-FAB040?logo=pre-commit&logoColor=FAB040)

![License](https://img.shields.io/badge/license-MIT-blue) ![App Version](https://img.shields.io/badge/dynamic/toml?url=https%3A%2F%2Fraw.githubusercontent.com%2FJvictorMarques%2Fmovie_rating%2Frefs%2Fheads%2Fmain%2Fapp%2Fpyproject.toml&query=%24.project.version&label=App+Version&logo=fastapi&logoColor=C0392B&color=C0392B) ![Chart Version](https://img.shields.io/badge/dynamic/yaml?url=https%3A%2F%2Fraw.githubusercontent.com%2FJvictorMarques%2Fmovie_rating%2Frefs%2Fheads%2Fmain%2Fk8s%2Fhelm%2Fcharts%2Fmovie-rating%2FChart.yaml&query=%24.version&label=Chart+Version&logo=helm&logoColor=1B4F72&color=1B4F72)


---

## Features

- **Authentication** — JWT-based login (`POST /api/v1/auth/token`) and token refresh; protected routes require a `Bearer` token
- **Users** — create, list, retrieve, update, and delete users (update/delete require ownership via JWT)
- **Movies** — create movies with director, synopsis, release date, and cast; list with optional filters by name and rating; update and delete
- **Ratings** — authenticated users can rate movies and update their existing ratings
- **Actors** — create, list, retrieve, update, and delete actors/actresses; linked to movies via a many-to-many relationship
- **Health check** — `GET /health` endpoint for liveness probes

---

## Technologies

| Layer | Technology |
|---|---|
| Framework | [FastAPI](https://fastapi.tiangolo.com/) |
| ORM | [SQLAlchemy 2.0](https://docs.sqlalchemy.org/) (async) |
| Database | PostgreSQL 17 |
| Validation | [Pydantic v2](https://docs.pydantic.dev/) |
| Authentication | [PyJWT](https://pyjwt.readthedocs.io/) (JWT Bearer tokens) |
| Password hashing | [pwdlib](https://github.com/frankie567/pwdlib) (Argon2) |
| Configuration | [pydantic-settings](https://docs.pydantic.dev/latest/concepts/pydantic_settings/) |
| Migrations | [Alembic](https://alembic.sqlalchemy.org/) |
| Container | Docker + Docker Compose |
| Observability | OpenTelemetry SDK, Grafana, Mimir, Tempo, Loki |
| Kubernetes | [kind](https://kind.sigs.k8s.io/), [Helm](https://helm.sh/), [ArgoCD](https://argo-cd.readthedocs.io/), Kong, Goldilocks |
| Cloud infrastructure | [Terraform](https://www.terraform.io/) — AWS VPC, ECR, RDS, SSM, EKS |
| Package manager | [uv](https://docs.astral.sh/uv/) |
| Linter / Formatter | [Ruff](https://docs.astral.sh/ruff/) |

---

## Prerequisites

- Python 3.13+
- [uv](https://docs.astral.sh/uv/) — package and project manager
- Docker and Docker Compose — to run PostgreSQL

**For Kubernetes (local):**
- [kind](https://kind.sigs.k8s.io/) — local Kubernetes clusters via Docker
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://helm.sh/docs/intro/install/)
- [ArgoCD CLI](https://argo-cd.readthedocs.io/en/stable/cli_installation/) — `argocd`

---

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/JvictorMarques/movie-rating.git
cd movie-rating
```

### 2. Enter the application directory and install dependencies

```bash
cd app
uv sync
```

### 3. Configure environment variables

Copy `app/.env.example` to `app/.env` and fill in the values:

```bash
cp .env.example .env
```

```env
ENVIRONMENT=development
DEBUG=false

DB_USER=postgres
DB_PASSWORD=postgres
DB_DATABASE=movie_rating
DB_ADDRESS=localhost
DB_PORT=5432

JWT_SECRET_KEY=your-secret-key
JWT_ALGORITHM=HS256
JWT_ACCESS_TOKEN_EXPIRE_MINUTES=15

# Optional — omit or leave blank to disable telemetry
OTLP_ENDPOINT=http://localhost:4317
```

---

## Running the application

There are three ways to run the application, depending on the scenario. **Run only one at a time** — options 1 and 2 bind to the same ports and will conflict if started simultaneously.

### Option 1 — Local development (`task app`)

Runs the FastAPI server locally with hot reload. Docker Compose is started automatically to provide PostgreSQL. Run from inside `app/`.

```bash
uv run task app
```

> The `app` task automatically runs lint, format, type checking, tests, starts the PostgreSQL container local `compose.yaml`, and applies migrations before launching the server.

The API will be available at `http://localhost:8000`. Interactive docs are at `http://localhost:8000/docs`.

### Option 2 — Docker container

Spins up the entire stack — app, PostgreSQL, Grafana, Mimir, Tempo, Loki, and the OpenTelemetry Collector — all containerized. Run from the **repo root**:

```bash
docker compose up -d
```

> Make sure `uv run task app` is not running before starting this option, as both expose the app on the same port.

All environment variables are read from `app/.env`. Grafana is available at `http://localhost:3000` (no login required).

### Option 3 — Kubernetes (kind) (recommended for production simulation)

Deploys the full application on a local [kind](https://kind.sigs.k8s.io/) cluster using Helm and ArgoCD (GitOps). Requires the prerequisites listed in the [Kubernetes section](#kubernetes-local) below.

```bash
# Create the cluster
kind create cluster --name movie-rating --config k8s/env/local/setup/kind-config.yaml

# Build and load images (both targets share the movie-rating image name;
# the Helm chart renders the migrations image as movie-rating:migrations-<version>)
docker build --target runtime -t movie-rating:latest app/
docker build --target migrations -t movie-rating:migrations-latest app/
kind load docker-image movie-rating:latest --name movie-rating
kind load docker-image movie-rating:migrations-latest --name movie-rating

# Add the Argo Helm repo, install ArgoCD, and bootstrap the App of Apps
helm repo add argo https://argoproj.github.io/argo-helm
helm upgrade --install --create-namespace --namespace argocd argocd argo/argo-cd \
  --version 9.5.15 -f k8s/env/local/values/argocd.yaml
kubectl wait --for=condition=available --timeout=120s deployment/argocd-server -n argocd
kubectl apply -f k8s/env/local/main.yaml

echo "127.0.0.1  movie-rating.local.com" | sudo tee -a /etc/hosts
```

ArgoCD will automatically sync all releases (Kong, Goldilocks, observability stack, and movie-rating). Monitor sync status with `kubectl get applications -n argocd`.

---

## Observability

The project ships a full OpenTelemetry observability stack:

| Component | Role | Port |
|---|---|---|
| OpenTelemetry Collector | Receives traces/metrics/logs from the app; scrapes host metrics | 4317 (gRPC) |
| Grafana Mimir | Prometheus-compatible remote-write metrics storage | 9009 |
| Grafana Tempo | Distributed tracing backend | 3200 |
| Grafana Loki | Log aggregation | 3100 |
| Grafana | Unified dashboards for all signals | 3000 |

The app exports traces, metrics, and structured logs via OTLP gRPC to the collector. A custom `Middleware` layer records `http_request` (counter) and `http_request_duration` (histogram) per route, method, and status code. Host-level CPU, memory, disk, network, and filesystem metrics are scraped via the `hostmetrics` receiver.

Two pre-built Grafana dashboards are automatically provisioned on startup:
- `docker/grafana/dashboards/metrics.json` — HTTP request metrics + database connection pool
- `docker/grafana/dashboards/logs.json` — structured logs with tabs for Errors, Warnings, and Info

### Telemetry environment variable

| Variable | Required | Description |
|---|---|---|
| `OTLP_ENDPOINT` | No | gRPC endpoint of the OTel Collector (e.g. `http://localhost:4317`). If not set, telemetry setup is skipped entirely. |

---

## Environment Variables

| Variable | Required | Default | Description |
|---|---|---|---|
| `ENVIRONMENT` | No | `development` | Non-`development` values enforce DB credential and JWT secret validation |
| `DEBUG` | No | `false` | Set to `true` to enable `DEBUG` log level; otherwise `INFO` |
| `DB_USER` | Prod only | `db` | PostgreSQL username |
| `DB_PASSWORD` | Prod only | `db` | PostgreSQL password |
| `DB_DATABASE` | Prod only | `db` | Database name |
| `DB_ADDRESS` | Prod only | `localhost` | Database host address |
| `DB_PORT` | No | `5432` | PostgreSQL port |
| `JWT_SECRET_KEY` | Prod only | insecure default | Secret key for signing JWT tokens |
| `JWT_ALGORITHM` | No | `HS256` | JWT signing algorithm |
| `JWT_ACCESS_TOKEN_EXPIRE_MINUTES` | No | `15` | Token TTL in minutes |
| `OTLP_ENDPOINT` | No | — | OTel Collector gRPC endpoint (e.g. `http://localhost:4317`). If omitted, telemetry is disabled. |

---

## API Reference

All endpoints are prefixed with `/api/v1`. Endpoints marked 🔒 require a `Authorization: Bearer <token>` header.

### Auth — `/api/v1/auth`

```http
POST   /api/v1/auth/token          # Obtain a JWT access token
POST   /api/v1/auth/refresh_token  # Refresh token (🔒 requires valid token)
```

**Login — request body:**
```json
{
  "email": "john@example.com",
  "password": "secret"
}
```

**Response:**
```json
{
  "access_token": "<jwt>",
  "token_type": "bearer"
}
```

---

### Users — `/api/v1/users`

```http
GET    /api/v1/users               # List all users (supports ?limit, ?offset, ?search_filter)
GET    /api/v1/users/{id}          # Get a user by ID
POST   /api/v1/users               # Create a user
PUT    /api/v1/users/{id}          # 🔒 Update a user (must own the account)
DELETE /api/v1/users/{id}          # 🔒 Delete a user (must own the account)
```

**Create user — request body:**
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "age": 28,
  "password": "secret"
}
```

---

### Movies — `/api/v1/movies`

```http
GET    /api/v1/movies              # List movies (supports ?limit, ?offset, ?name_filter, ?rating_filter)
GET    /api/v1/movies/{id}         # Get a movie by ID (includes cast and rating)
POST   /api/v1/movies              # Create a movie
PUT    /api/v1/movies/{id}         # Update a movie
DELETE /api/v1/movies/{id}         # Delete a movie
POST   /api/v1/movies/{id}/ratings # 🔒 Rate a movie
PUT    /api/v1/movies/{id}/ratings # 🔒 Update an existing rating
```

**Create movie — request body:**
```json
{
  "name": "Inception",
  "synopsis": "A thief who steals corporate secrets through dream-sharing technology.",
  "director": "Christopher Nolan",
  "release_date": "2010-07-16",
  "cast_ids": [1, 2]
}
```

**Rate a movie — request body:**
```json
{
  "rating": 9.5
}
```

> Rating must be between 0 (exclusive) and 10 (inclusive). The authenticated user is identified via the `Bearer` token.

---

### Actors — `/api/v1/actors`

```http
GET    /api/v1/actors              # List all actors (supports ?limit, ?offset, ?search_filter)
GET    /api/v1/actors/{id}         # Get an actor by ID
POST   /api/v1/actors              # Create an actor/actress
PUT    /api/v1/actors/{id}         # Update an actor/actress
DELETE /api/v1/actors/{id}         # Delete an actor/actress
```

**Create actor — request body:**
```json
{
  "name": "Leonardo DiCaprio",
  "age": 49
}
```

---

### Health Check

```http
GET /health
```

```json
{ "message": "healthy" }
```

---

## Project Structure

```
movie-rating/
├── compose.yaml                # Root orchestration — includes app/ and docker/ composes
├── CHANGELOG.md
├── .pre-commit-config.yaml
├── scripts/
│   ├── app/
│   │   ├── load_test.py        # End-to-end load test
│   │   └── latency_sim.py      # Burst traffic / p99 latency simulator
│   └── k8s/cluster/
│       └── setup.sh            # Automated kind cluster setup
├── terraform/                  # AWS infrastructure (VPC, ECR, RDS, SSM, EKS modules)
├── app/                        # FastAPI application
│   ├── app.py                  # Entry point
│   ├── compose.yaml            # App + PostgreSQL + migrations services
│   ├── Dockerfile
│   ├── pyproject.toml
│   ├── alembic.ini
│   ├── migrations/             # Alembic migration scripts
│   ├── src/
│   │   ├── core/
│   │   │   ├── database.py     # Async engine and session factory
│   │   │   ├── settings.py     # Environment-based config (pydantic-settings)
│   │   │   ├── security.py     # JWT creation/verification, password hashing
│   │   │   ├── telemetry.py    # OpenTelemetry SDK setup (traces, metrics, logs)
│   │   │   ├── metrics.py      # OTel meter instruments (http_request, http_request_duration)
│   │   │   ├── middleware.py   # Starlette middleware that records HTTP metrics
│   │   │   └── constants.py    # Shared error message strings
│   │   ├── models/
│   │   │   ├── base.py         # SQLAlchemy declarative base
│   │   │   ├── users.py
│   │   │   ├── movies.py
│   │   │   ├── actors.py
│   │   │   ├── users_movies.py # User ↔ Movie with rating
│   │   │   └── movies_actors.py
│   │   ├── repositories/       # Raw SQLAlchemy queries
│   │   │   ├── users.py
│   │   │   ├── movies.py
│   │   │   └── actors.py
│   │   ├── services/           # Business logic, raises HTTPException; emits structured logs
│   │   │   ├── auth.py         # get_current_user dependency, ownership check
│   │   │   ├── users.py
│   │   │   ├── movies.py
│   │   │   └── actors.py
│   │   ├── routers/            # FastAPI route handlers
│   │   │   ├── auth.py         # POST /token, POST /refresh_token
│   │   │   ├── users.py
│   │   │   ├── movies.py
│   │   │   └── actors.py
│   │   └── schemas/            # Pydantic request/response models
│   │       ├── auth.py         # Token, LoginRequest
│   │       ├── common.py       # Shared type aliases (Age, Name, Rating)
│   │       ├── users.py
│   │       ├── movies.py
│   │       └── actors.py
│   └── tests/
│       ├── conftest.py         # Fixtures (session, client)
│       ├── test_auth.py
│       ├── test_users.py
│       ├── test_movies.py
│       └── test_actors.py
└── docker/
    ├── compose.yaml
    ├── grafana/
    │   ├── datasources.yaml    # Grafana datasource provisioning
    │   ├── dashboards.yaml     # Grafana dashboard provisioning pointer
    │   └── dashboards/
    │       ├── metrics.json    # HTTP metrics + DB pool dashboard
    │       └── logs.json       # Structured logs dashboard (Errors/Warnings/Info tabs)
    ├── loki/loki.yaml
    ├── mimir/mimir.yaml
    ├── otel/collector.yaml     # OTLP receiver + hostmetrics scraper
    └── tempo/tempo.yaml
```

---

## Kubernetes (local)

The `k8s/` directory contains everything needed to run the application on a local [kind](https://kind.sigs.k8s.io/) cluster or on AWS EKS. Deployments are managed via [ArgoCD](https://argo-cd.readthedocs.io/) (GitOps) using the App of Apps pattern — ArgoCD reads the repository and syncs all Helm releases automatically.

```
k8s/
├── env/
│   ├── local/                            # Local (kind) environment
│   │   ├── main.yaml                     # ArgoCD App of Apps — bootstraps the local cluster
│   │   ├── setup/
│   │   │   └── kind-config.yaml          # kind cluster definition (1 control-plane + 3 workers, ports 80/443)
│   │   ├── argo/
│   │   │   ├── apps.yaml                 # ApplicationSet — all infra releases (Kong, Goldilocks, obs stack)
│   │   │   └── movie-rating.yaml         # ArgoCD Application for the app chart
│   │   └── values/                       # Helm values per release
│   │       ├── argocd.yaml
│   │       ├── kong.yaml
│   │       ├── goldilocks.yaml
│   │       ├── grafana.yaml
│   │       ├── loki.yaml
│   │       ├── mimir.yaml
│   │       ├── tempo.yaml
│   │       ├── otel-collector.yaml
│   │       └── otel-collector-node.yaml
│   └── aws/                              # AWS (EKS) environment
│       ├── main.yaml                     # ArgoCD App of Apps — bootstraps the AWS cluster
│       ├── argo/
│       │   └── movie-rating.yaml         # ArgoCD Application for the app chart
│       └── values/
│           └── movie-rating.yaml         # Helm values for the app chart
└── helm/
    └── charts/
        └── movie-rating/                 # Application Helm chart
            ├── Chart.yaml                # Chart metadata; depends on Bitnami PostgreSQL (local only)
            ├── values.yaml               # Default values (image refs, resources, secretStore, otlp, ingress)
            └── templates/
                ├── app.yaml              # Deployment + Service + Ingress; Secret (local) or ExternalSecret (AWS)
                ├── migrations.yaml       # pre-upgrade Job that runs Alembic migrations
                ├── secret-store.yaml     # SecretStore for AWS SSM Parameter Store (AWS only)
                └── _helpers.tpl          # Named templates for resource names and secret refs
```

### Prerequisites

- [kind](https://kind.sigs.k8s.io/) — local Kubernetes clusters via Docker
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://helm.sh/docs/intro/install/)
- [ArgoCD CLI](https://argo-cd.readthedocs.io/en/stable/cli_installation/) — `argocd`

### Automated setup (recommended)

The `scripts/k8s/cluster/setup.sh` script handles the entire local setup in a single command — it creates the kind cluster (skips if it already exists), builds both Docker images, loads them into the cluster, installs ArgoCD via Helm, applies the App of Apps manifest, adds `movie-rating.local.com` to `/etc/hosts`, and waits until the application returns `200 /health`.

**Dependencies:** `kind`, `helm`, `kubectl`, `docker` (all must be on `$PATH`).

```bash
# Create cluster and deploy everything
bash scripts/k8s/cluster/setup.sh --create-cluster

# Delete the cluster (prompts for confirmation)
bash scripts/k8s/cluster/setup.sh --delete-cluster
```

The script uses `latest` as the image tag by default. To use a different tag, edit `TAG_VERSION` at the top of the file — make sure it matches `app.image.version` and `migrations.image.version` in `k8s/env/local/argo/movie-rating.yaml`.

If you prefer to run the steps manually, follow sections 1–5 below.

---

### 1. Create the kind cluster

```bash
kind create cluster --name movie-rating --config k8s/env/local/setup/kind-config.yaml
```

### 2. Build the Docker images

The application uses a multi-stage Dockerfile. The **runtime** image is used by the API deployment; the **migrations** target retains `alembic.ini`, `migrations/`, and the full `uv` toolchain.

Run from the **repo root** with the desired tag. Before building, update the image versions in the ArgoCD Application manifest at `k8s/env/local/argo/movie-rating.yaml` so ArgoCD deploys the correct tag:

```yaml
# k8s/env/local/argo/movie-rating.yaml
spec:
  source:
    helm:
      releaseName: movie-rating
      valuesObject:
        app:
          image:
            tag: movie-rating      # local image name
            version: 1.0.0         # must match the tag used below
        migrations:
          image:
            tag: movie-rating      # same image name — Helm prepends "migrations-" to the version
            version: 1.0.0         # must match the tag used below → final: movie-rating:migrations-1.0.0
```

Then build the images using the same tag:

```bash
# Runtime image — used by the API Deployment
docker build --target runtime -t movie-rating:1.0.0 app/

# Migrations image — used by the migrations Job
# The Helm chart renders: {{ tag }}:migrations-{{ version }}, so the image must be tagged accordingly
docker build --target migrations -t movie-rating:migrations-1.0.0 app/
```

### 3. Load the images into kind

kind clusters use their own container runtime, so images must be loaded explicitly:

```bash
kind load docker-image movie-rating:1.0.0 --name movie-rating
kind load docker-image movie-rating:migrations-1.0.0 --name movie-rating
```

### 4. Deploy with ArgoCD

Install ArgoCD into the cluster and apply the App of Apps manifest. ArgoCD will then automatically sync all releases from the repository.

```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm upgrade --install --create-namespace --namespace argocd argocd argo/argo-cd \
  --version 9.5.15 -f k8s/env/local/values/argocd.yaml
kubectl wait --for=condition=available --timeout=120s deployment/argocd-server -n argocd

# Bootstrap — creates the App of Apps that manages all other releases
kubectl apply -f k8s/env/local/main.yaml
```

This triggers ArgoCD to sync:
- **ArgoCD itself** — self-managed via the ApplicationSet
- **Kong Ingress Controller** (`kong` namespace) — routes external traffic into the cluster
- **Goldilocks** (`goldilocks` namespace) — VPA-based resource recommendations
- **Observability stack** (`observability` namespace) — Mimir, Tempo, Loki, OTel Collector (app + node), and Grafana; all wired together via in-cluster DNS
- **movie-rating** (`movie-rating` namespace) — the application chart, which includes PostgreSQL as a subchart and runs migrations as a pre-upgrade Job

Monitor sync status:

```bash
kubectl get applications -n argocd
```

> The application may take a few moments while the migration Job completes. Monitor with:
> ```bash
> kubectl get jobs -n movie-rating -w
> ```

### 5. Configure /etc/hosts

Add the Ingress host to your local DNS resolver:

```bash
echo "127.0.0.1  movie-rating.local.com" | sudo tee -a /etc/hosts
```

The API will then be available at `http://movie-rating.local.com/api/v1/`.

### Helm chart reference

| Value | Default | Description |
|---|---|---|
| `local.enabled` | `true` | Enables local-only resources (PostgreSQL subchart, Kubernetes `Secret`). Set to `false` for AWS. |
| `app.image.tag` | `movie-rating` | Image repository name (local) or ECR URI (AWS) |
| `app.image.version` | `1.0.0` | Image tag appended to `app.image.tag` |
| `app.ingress.enabled` | `true` | Whether to render the Ingress resource |
| `app.ingress.host` | `movie-rating.local.com` | Ingress hostname |
| `app.ingress.className` | `kong` | Ingress class (`kong` locally, `alb` on AWS) |
| `migrations.image.tag` | `movie-rating-migrations` | Image name or ECR URI for the migrations Job. The final image is `<tag>:migrations-<version>` — override to `movie-rating` (local) or the ECR URI (AWS) |
| `migrations.image.version` | `1.0.0` | Version portion of the migrations tag; combined as `migrations-<version>` |
| `otlp.endpoint` | (otel-collector cluster DNS) | OTLP gRPC endpoint injected into the app Secret |
| `secretStore.name` | `aws-ssm` | Name of the `SecretStore` resource (AWS only) |
| `secretStore.region` | `us-east-1` | AWS region for SSM Parameter Store (AWS only) |

### AWS deployment

When `local.enabled: false`, the chart targets an AWS EKS cluster and switches from local resources to AWS-managed ones:

- **PostgreSQL** — the Bitnami subchart is disabled; the app connects to an RDS instance provisioned by the Terraform `rds` module
- **Secrets** — instead of a plain Kubernetes `Secret`, the chart renders an `ExternalSecret` for both the app and the migrations Job. The External Secrets Operator (installed via the `eks-helm-releases` Terraform module) syncs credentials from AWS SSM Parameter Store into the cluster
- **SecretStore** — a `SecretStore` resource is created to point the External Secrets Operator at the correct SSM path and region. The `secretStore.name` and `secretStore.region` values are required when `local.enabled: false`
- **Ingress** — `app.ingress.className` should be set to `alb`; the chart adds the ALB-specific annotations (`target-type: ip`, `scheme: internet-facing`, `healthcheck-path: /health`) automatically

#### 1. Build and push images to ECR

> **Note:** Docker image builds and pushes to ECR are automated by GitHub Actions (`main-docker.yaml` on push to `main` or `app/v*.*.*` tags, and as part of the `manual-infrastructure-apply.yaml` deploy workflow). For manual builds, use `scripts/aws/build.sh` (requires `--account-id`; optionally accepts `--region`, `--application-repository`, and `--helm-repository`). To build and push manually:

Build each image using the correct `--target` and push to your ECR repository. Follow the [AWS ECR push image guide](https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-push-ecr-image.html) for authentication and push steps — the only difference per image is the `--target` flag:

```bash
# Runtime image — used by the API Deployment
docker build --target runtime -t <ecr-uri>:latest app/

# Migrations image — used by the migrations Job
docker build --target migrations -t <ecr-uri>:migrations-latest app/
```

#### 2. Set required values

Edit `k8s/env/aws/values/movie-rating.yaml` and fill in the image URIs and secret store settings before deploying:

| Value | Description |
|---|---|
| `app.image.tag` | Full ECR URI for the runtime image (e.g. `<account-id>.dkr.ecr.<region>.amazonaws.com/movie-rating`) |
| `app.image.version` | Image tag to deploy (e.g. `latest`) |
| `migrations.image.tag` | Full ECR URI for the migrations image (e.g. `<account-id>.dkr.ecr.<region>.amazonaws.com/movie-rating`) |
| `migrations.image.version` | Migrations image tag (e.g. `migrations-latest`) |
| `secretStore.region` | AWS region where SSM parameters are stored (e.g. `us-east-1`) |

#### 3. Deploy with ArgoCD

ArgoCD and all cluster addons (AWS Load Balancer Controller, Cluster Autoscaler, External Secrets Operator, Metrics Server) are installed by the `eks-helm-releases` Terraform module — no manual Helm install needed. Once Terraform finishes, configure `kubectl` and apply the App of Apps manifest:

```bash
aws eks update-kubeconfig --region <region> --name <cluster-name>

# Bootstrap — ArgoCD App of Apps that manages the app chart
kubectl apply -f k8s/env/aws/main.yaml
```

ArgoCD will sync the movie-rating chart from the repository automatically. The full AWS infrastructure provisioning and app bootstrap is also available as a GitHub Actions workflow (`manual-infrastructure-apply.yaml`, `workflow_dispatch`).

---

## Terraform (AWS)

The `terraform/` directory contains a modular Terraform configuration that provisions the full AWS infrastructure needed to run the application in production.

```text
terraform/
├── main.tf           # Root module — wires VPC, ECR, RDS, SSM, EKS, pod identities, and addon releases
├── providers.tf      # AWS and Helm provider configurations
├── versions.tf       # Terraform version and required_providers block
├── variables.tf      # Input variables (region, project name, DB config, EKS version, etc.)
├── terraform.tfvars  # Variable values (not committed — add to .gitignore)
└── modules/
    ├── vpc/                    # VPC with public/private subnets, IGW, NAT gateway, route tables
    ├── ecr/                    # ECR repository for Docker images
    ├── rds/                    # RDS PostgreSQL + security group allowing EKS cluster access
    ├── ssm/                    # SSM Parameter Store — DB credentials and JWT secret
    ├── eks/                    # EKS cluster + managed node group + OIDC provider for IRSA
    ├── eks-pod-identity-roles/ # IAM Pod Identity roles for LBC, Cluster Autoscaler, and External Secrets
    └── eks-helm-releases/      # Helm releases for cluster addons (ArgoCD, LBC, Cluster Autoscaler, ESO, Metrics Server)
```

### Module overview

| Module | Resources |
|---|---|
| `vpc` | VPC, public/private subnets across AZs, IGW, NAT gateway, route tables |
| `ecr` | ECR repository for `movie-rating` images |
| `rds` | RDS PostgreSQL instance (private subnets, security group restricted to EKS cluster nodes) |
| `ssm` | SSM SecureString parameters for DB credentials + auto-generated JWT secret (`random_password`) |
| `eks` | EKS cluster + managed node group + OIDC provider (enables IRSA for add-ons) |
| `eks-pod-identity-roles` | IAM Pod Identity roles for AWS Load Balancer Controller, Cluster Autoscaler, and External Secrets Operator |
| `eks-helm-releases` | Installs cluster addons via Helm: ArgoCD, AWS Load Balancer Controller, Cluster Autoscaler, External Secrets Operator, Metrics Server |

### Usage

```bash
cd terraform/
terraform init
terraform plan
terraform apply
```

All modules receive their inputs from the root `main.tf` — the RDS endpoint and credentials are automatically forwarded to SSM after the database is created.

---

## Scripts

The `scripts/app/` directory contains utilities for manual testing and observability validation. They require `httpx` (`uv add httpx` or install it separately) and a running API instance.

### Load test

Exercises the full API lifecycle — creates users, actors, and movies, authenticates each user, submits ratings, queries all resources, and fires intentional 4xx errors to populate error metrics.

```bash
uv run scripts/app/load_test.py
```

### Latency simulation

Sends bursts of requests with variable artificial delay to produce realistic p50/p99 latency distributions in Grafana dashboards.

```bash
uv run scripts/app/latency_sim.py
```

Both scripts target `http://localhost:8000/api/v1` by default and must be run from inside `app/`.

---

## Running Tests

From inside `app/`:

```bash
uv run task test
```

Generates an HTML coverage report at `app/htmlcov/index.html`.

---

## License

This project is licensed under the [MIT License](LICENSE).
