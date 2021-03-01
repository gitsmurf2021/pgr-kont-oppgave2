terraform {
  backend "gcs" {
    credentials = "google_service_key.json"
    bucket  = "bucktesteyo" #change this name to your the bucket you created in task 2
    prefix  = "terraform/state"

  }
}