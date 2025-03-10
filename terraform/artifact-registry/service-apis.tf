resource "google_project_service" "cloud-resource-manager-api" {
  project = var.project
  service = "cloudresourcemanager.googleapis.com"

  disable_on_destroy = false
}

resource "google_project_service" "artifact-registry-api" {
  project = var.project
  service = "artifactregistry.googleapis.com"

  disable_on_destroy = false
  depends_on         = [google_project_service.cloud-resource-manager-api]
}
