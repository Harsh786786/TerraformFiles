resource "google_compute_network" "auto-mode-tf" {
  name = "auto-mode-tf"
  auto_create_subnetworks = true
}

resource "google_compute_network" "custom-mode-tf" {
  name = "custom-mode-tf"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sg-sub" {
  name = "sg-subnetwork"
  network = google_compute_network.custom-mode-tf.id
  ip_cidr_range = "10.0.1.0/24"
  region = "asia-southeast1"
  private_ip_google_access = true
  
}

resource "google_compute_firewall" "icmp" {
  name = "allow-icmp"
  network = google_compute_network.custom-mode-tf.id
  allow {
    protocol = "icmp"
  }
  source_ranges = [ "49.36.82.10/32" ]
priority = 450
  
}