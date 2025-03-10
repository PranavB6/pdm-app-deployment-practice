resource "google_artifact_registry_repository" "local" {
  repository_id = "local"
  location      = var.region

  format = "DOCKER"
  mode   = "STANDARD_REPOSITORY"

  docker_config {
    immutable_tags = false
  }

  cleanup_policy_dry_run = true

  depends_on = [google_project_service.artifact-registry-api]
}
