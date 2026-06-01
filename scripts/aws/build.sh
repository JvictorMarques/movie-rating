#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HELP="
Usage: $(basename "$0" | cut -d. -f1) [OPTIONS]
Options:
    -h, Show this help message
    --region AWS region to push the Docker images and Helm charts (default: us-east-1)
    --account-id AWS account ID to push the Docker images and Helm charts
    --application-repository Name of the ECR repository for application Docker images (default: movie-rating)
    --helm-repository Name of the ECR repository for Helm charts (default: helm-chart)
"

[ ! -x "$(command -v aws)" ] && echo "Error: AWS CLI is not installed. Please install AWS CLI to use this script." >&2 && exit 1
[ ! -x "$(command -v docker)" ] && echo "Error: docker is not installed. Please install docker to use this script." >&2 && exit 1
[ ! -x "$(command -v helm)" ] && echo "Error: helm is not installed. Please install helm to use this script." >&2 && exit 1

AWS_REGION="us-east-1"
AWS_ACCOUNT_ID=""

APPLICATION_DIR="${SCRIPT_DIR}"/../../app
APPLCATION_NAME="movie-rating"
APPLICATION_VERSION=$(grep version "${APPLICATION_DIR}"/pyproject.toml | cut -d '=' -f2 | tr -d ' "')

HELM_CHART_DIR="${SCRIPT_DIR}"/../../k8s/helm/charts/movie-rating
HELM_PACKAGE_DIR="${SCRIPT_DIR}"/../../k8s/helm/packages
HELM_REPOSITORY_NAME="helm-chart"
HELM_VERSION=$(grep -m 1 version "${HELM_CHART_DIR}"/Chart.yaml | cut -d ':' -f 2 | tr -d ' ')

APPLICATION_REPOSITORY_OVERRIDE=""
HELM_REPOSITORY_OVERRIDE=""

while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            echo "$HELP"
            exit 0
            ;;
        --region)
            AWS_REGION="$2"
            shift 2
            ;;
        --account-id)
            AWS_ACCOUNT_ID="$2"
            shift 2
            ;;
        --application-repository)
            APPLICATION_REPOSITORY_OVERRIDE="$2"
            shift 2
            ;;
        --helm-repository)
            HELM_REPOSITORY_OVERRIDE="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            echo "$HELP"
            exit 1
            ;;
    esac
    shift
done

[[ -z "$AWS_ACCOUNT_ID" ]] && echo "Error: AWS account ID is required. Please provide it using the --account-id option." >&2 && exit 1

ECR_BASE="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com"
ECR_LOGIN_URL="${ECR_BASE}"
ECR_APPLICATION_REPOSITORY="${ECR_BASE}/${APPLICATION_REPOSITORY_OVERRIDE:-${APPLCATION_NAME}}"
ECR_HELM_REPOSITORY="${ECR_BASE}/${HELM_REPOSITORY_OVERRIDE:-${HELM_REPOSITORY_NAME}}"

aws ecr get-login-password --region "${AWS_REGION}" | docker login --username AWS --password-stdin "${ECR_LOGIN_URL}"

docker build -t "${APPLCATION_NAME}":"${APPLICATION_VERSION}" "${APPLICATION_DIR}" --target runtime
docker build -t "${APPLCATION_NAME}":migrations-"${APPLICATION_VERSION}" "${APPLICATION_DIR}" --target migrations
docker tag "${APPLCATION_NAME}":"${APPLICATION_VERSION}" "${ECR_APPLICATION_REPOSITORY}":"${APPLICATION_VERSION}"
docker tag "${APPLCATION_NAME}":migrations-"${APPLICATION_VERSION}" "${ECR_APPLICATION_REPOSITORY}":migrations-"${APPLICATION_VERSION}"
docker push "${ECR_APPLICATION_REPOSITORY}" --all-tags

aws ecr get-login-password --region "${AWS_REGION}" | helm registry login --username AWS --password-stdin "${ECR_LOGIN_URL}"

helm dependency update "${HELM_CHART_DIR}"
helm package "${HELM_CHART_DIR}" --destination "${HELM_PACKAGE_DIR}"
helm push "${HELM_PACKAGE_DIR}"/movie-rating-"${HELM_VERSION}".tgz oci://"${ECR_HELM_REPOSITORY}"
