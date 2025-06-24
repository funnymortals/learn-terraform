locals {
  project_id = "learn-tf-code"
}


resource "google_compute_network" "default" {
  name    = "default"
  project = local.project_id
}

import {
  to = google_compute_network.default
  id = "6915920698636494680"
}


resource "google_compute_instance" "temp" {
  name         = "temp"
  machine_type = "europe-west3"
  zone         = "europe-west3-a"
  project      = local.project_id

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "NVME"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

  /*   service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  } */
}

# lets
