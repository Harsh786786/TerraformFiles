resource "google_compute_instance" "vm-hut" {
  name = "vm-hut"
  zone = "asia-southeast1-a"
  machine_type = "e2-standard-4"
  allow_stopping_for_update =  true 
  network_interface {
    network = "default"
    subnetwork = "default"
  }
  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20230306"
      size = 35
    }
    auto_delete =  false
  }
  labels =  {
    env = "billing"
  }
  scheduling {
    preemptible = false
    automatic_restart = false
  }

  service_account {
    email = "hut-service@linen-arch-374006.iam.gserviceaccount.com"
    scopes = [ "cloud-platform" ]
  }
  
}

resource "google_compute_disk" "disk-1" {
  name = "disk-1-new"
  zone = "asia-southeast1-a"
  size = 15
  type = "pd-ssd"
}

resource "google_compute_attached_disk" "adisk" {
  instance = "insnew-instance"
  disk = google_compute_disk.disk-1.id
  
}