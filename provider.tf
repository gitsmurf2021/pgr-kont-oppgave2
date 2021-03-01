terraform {
  required_providers {
    google = {
      source = "hashicorp/google"

    }
  }
}

provider "google" {
  version = "3.58.0"
  credentials = file("../google_service_key.json")
  project     = var.project_id
  region      = "us-central1"
}