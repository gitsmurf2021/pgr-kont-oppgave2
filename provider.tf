terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  credentials = file("google_service_key.json")
  project     = var.project_id
  region      = "us-central1"
  zone         = "us-central1-a"
}