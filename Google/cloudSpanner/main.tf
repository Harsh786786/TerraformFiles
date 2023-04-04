resource "google_spanner_instance" "ht_spanner" {
  name = "htspanner"
  display_name = "Thisismyhtinstance"
  config = "regional-asia-south1"
  num_nodes = 1
  
  
}

resource "google_spanner_database" "dbht" {
  name = "dbht1"
  instance = google_spanner_instance.ht_spanner.name
  deletion_protection = false
} 