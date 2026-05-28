#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HELP="
Usage: $(basename "$0" | cut -d. -f1) [OPTIONS]
Options:
    -h, Show this help message
    -v Show the version of the script
    --create-cluster Create the Kubernetes cluster and deploy the application
    --delete-cluster Delete the Kubernetes cluster
"

VERSION="1.0.0"
CLUSTER_NAME="movie-rating"
APPLICATION_NAMESPACE="movie-rating"

TAG_VERSION="latest"
APP_IMAGE_TAG_PREFIX="movie-rating"
MIGRATIONS_IMAGE_TAG_PREFIX="movie-rating-migrations"

ARGO_CD_VERSION="9.5.15"
ARGO_CD_REPOSITORY="https://argoproj.github.io/argo-helm"

HOST_DOMAIN="movie-rating.local.com"

[ ! -x "$(command -v kind)" ] && echo "Error: kind is not installed. Please install kind to use this script." >&2 && exit 1
[ ! -x "$(command -v helm)" ] && echo "Error: helm is not installed. Please install helm to use this script." >&2 && exit 1
[ ! -x "$(command -v kubectl)" ] && echo "Error: kubectl is not installed. Please install kubectl to use this script." >&2 && exit 1
[ ! -x "$(command -v docker)" ] && echo "Error: docker is not installed. Please install docker to use this script." >&2 && exit 1

function create_cluster() {
    if kind get clusters | grep -q "${CLUSTER_NAME}"; then
        echo "Cluster ${CLUSTER_NAME} already exists. Skipping cluster creation."
    else
        kind create cluster --name "${CLUSTER_NAME}" --config "${SCRIPT_DIR}"/../../../k8s/env/local/setup/kind-config.yaml
    fi
}

function delete_cluster() {
    read -r -p "Are you sure you want to delete the cluster ${CLUSTER_NAME}? This action cannot be undone. (y/N): " CONFIRM
    if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
        echo "Cluster deletion cancelled."
        exit 0
    fi
    kind delete cluster --name "${CLUSTER_NAME}"
    echo "Cluster ${CLUSTER_NAME} deleted successfully."
}

function build_images() {
    docker build -t ${APP_IMAGE_TAG_PREFIX}:${TAG_VERSION} "${SCRIPT_DIR}"/../../../app --target runtime
    docker build -t ${MIGRATIONS_IMAGE_TAG_PREFIX}:${TAG_VERSION} "${SCRIPT_DIR}"/../../../app --target migrations
}

function load_images_into_cluster() {
    kind load docker-image ${APP_IMAGE_TAG_PREFIX}:${TAG_VERSION} --name "${CLUSTER_NAME}"
    kind load docker-image ${MIGRATIONS_IMAGE_TAG_PREFIX}:${TAG_VERSION} --name "${CLUSTER_NAME}"
}

function deploy_argocd() {
    helm repo add argo ${ARGO_CD_REPOSITORY}

    helm upgrade argocd argo/argo-cd \
        --install \
        --create-namespace \
        --namespace argocd \
        --version ${ARGO_CD_VERSION} \
        -f "${SCRIPT_DIR}"/../../../k8s/env/local/values/argocd.yaml
}

function deploy_application() {
    kubectl apply -f "${SCRIPT_DIR}"/../../../k8s/env/local/main.yaml
}

function update_hosts_file() {
    if ! grep -q "${HOST_DOMAIN}" /etc/hosts; then
        echo "Adding ${HOST_DOMAIN} to /etc/hosts"
        echo "127.0.0.1  ${HOST_DOMAIN}" | sudo tee -a /etc/hosts
    fi
}

function wait_for_application() {
    echo -e "Waiting for the application to be healthy it takes a while for the application to start up and become healthy. Please wait"
    until [ "$(curl -s -o /dev/null -w "%{http_code}" http://"${HOST_DOMAIN}"/health)" = "200" ]; do
        for _ in {1..10}; do
            for dots in "." ".." "..."; do
                printf "\r%s   " "$dots"
                sleep 0.5
            done
        done
    done

    echo "Application is healthy and ready to use at http://${HOST_DOMAIN}"
}

function label_namespace() {
    kubectl label ns "$APPLICATION_NAMESPACE" goldilocks.fairwinds.com/enabled=true
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            echo "$HELP"
            exit 0
            ;;
        -v|--version)
            echo "Version: $VERSION"
            exit 0
            ;;
        --create-cluster)
            CREATE_CLUSTER=true
            ;;
        --delete-cluster)
            DELETE_CLUSTER=true
            ;;
        *)
            echo "Unknown option: $1"
            echo "$HELP"
            exit 1
            ;;
    esac
    shift
done

function main() {
    if [[ $CREATE_CLUSTER == true && $DELETE_CLUSTER == true ]]; then
        echo "Cannot create and delete cluster at the same time. Please choose one option."
        exit 1
    elif [[ $CREATE_CLUSTER == true ]]; then
        create_cluster
        build_images
        load_images_into_cluster
        deploy_argocd
        deploy_application
        update_hosts_file
        wait_for_application
        label_namespace
        exit 0
    elif [[ $DELETE_CLUSTER == true ]]; then
        delete_cluster
        exit 0
    else
        echo "No action specified. Please use --create-cluster or --delete-cluster."
        echo "$HELP"
        exit 1
    fi
}

main
