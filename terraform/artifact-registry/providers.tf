terraform {

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.24"
    }
  }

  required_version = ">= 1.11.0"
}

provider "google" {
  project = var.project
  region  = var.region
}
