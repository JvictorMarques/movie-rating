#!/usr/bin/env bash

CLUSTER_NAME="kind"
TAG_VERSION="latest"
APP_IMAGE_TAG_PREFIX="movie-rating"
MIGRATIONS_IMAGE_TAG_PREFIX="movie-rating-migrations"
HOST_DOMAIN="movie-rating.local.com"

# Create a Kubernetes cluster using kind
if kind get clusters | grep -q "${CLUSTER_NAME}"; then
    echo "Cluster ${CLUSTER_NAME} already exists. Skipping cluster creation."
else
    kind create cluster --name "${CLUSTER_NAME}" --config kind-config.yaml
fi

docker build -t ${APP_IMAGE_TAG_PREFIX}:${TAG_VERSION} ../../app --target runtime
docker build -t ${MIGRATIONS_IMAGE_TAG_PREFIX}:${TAG_VERSION} ../../app --target migrations

# Load the Docker images into the kind cluster
kind load docker-image ${APP_IMAGE_TAG_PREFIX}:${TAG_VERSION} --name "${CLUSTER_NAME}"
kind load docker-image ${MIGRATIONS_IMAGE_TAG_PREFIX}:${TAG_VERSION} --name "${CLUSTER_NAME}"

# Apply infrastructure and observability releases (no app-specific overrides)
if ! helmfile apply -e local -l name!=movie-rating; then
    echo "Failed to apply infrastructure/observability releases. Exiting."
    exit 1
fi

# Apply movie-rating with image tag and ingress overrides
if ! helmfile apply -e local -l name=movie-rating \
    --set app.image.tag="${APP_IMAGE_TAG_PREFIX}" \
    --set app.image.version="${TAG_VERSION}" \
    --set migrations.image.tag="${MIGRATIONS_IMAGE_TAG_PREFIX}" \
    --set migrations.image.version="${TAG_VERSION}" \
    --set app.ingress.host="${HOST_DOMAIN}"; then
    echo "Failed to apply movie-rating release. Exiting."
    exit 1
fi

if ! grep -q "${HOST_DOMAIN}" /etc/hosts; then
    echo "Adding ${HOST_DOMAIN} to /etc/hosts"
    echo "127.0.0.1  ${HOST_DOMAIN}" | sudo tee -a /etc/hosts
fi

echo -e "Waiting for the application to be healthy\n"
until [ "$(curl -s -o /dev/null -w "%{http_code}" http://${HOST_DOMAIN}/health)" = "200" ]; do
    echo "..."
    sleep 5
done

echo "Application is healthy and ready to use at http://${HOST_DOMAIN}"
