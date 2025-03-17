# !/bin/bash

GCP_PROJECT_ID="project-cicd-451516"
GCP_CLOUD_DEPLOY_DELIVERY_PIPELINE="cloud-run-pipeline"
GCP_CLOUD_DEPLOY_TARGET_REGION="northamerica-northeast2"

IMAGE="northamerica-northeast2-docker.pkg.dev/project-cicd-451516/local/pranav-app@sha256:d7f07d9915598c683a4a5263655d18ef62bb47cee32ac1b95a6dbe9b9723e9f3"

gcloud deploy releases create staging-release-007 \
    --project="${GCP_PROJECT_ID}" \
    --region="${GCP_CLOUD_DEPLOY_TARGET_REGION}" \
    --delivery-pipeline="${GCP_CLOUD_DEPLOY_DELIVERY_PIPELINE}" \
    --images="image=${IMAGE}"
