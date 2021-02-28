resource "google_service_account" "default" {
  account_id   = "sa"
  display_name = "Service Account"
}

resource "google_compute_instance" "default" {
  name         = "devops-er-goy"
  machine_type = var.machine-type
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }


  network_interface {
    network = "default"

    access_config {
    }
  }

  service_account {
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}