resource "google_service_account" "default" {
  account_id   = "sa"
  display_name = "Service Account"
}

resource "google_compute_instance" "default" {
  name         = "computeInstanceName"
  machine_type = "f1-micro" #var.machine-type
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