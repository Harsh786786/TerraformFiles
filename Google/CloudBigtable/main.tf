
resource "google_bigtable_instance" "ht-biginstance" {

  name = "htbigtableinstance"
  deletion_protection = false
  labels = {
    "env" = "testing"
  }
  cluster {
    cluster_id = "ht-clusterfor786"
    num_nodes = 1
    storage_type = "SSD"
  }
  
}
resource "google_bigtable_table" "table_instance" {
  name = "tableforht786"
  instance_name = google_bigtable_instance.ht-biginstance.name
}