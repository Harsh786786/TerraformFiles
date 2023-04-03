resource "google_bigquery_dataset" "ds_ht" {
  dataset_id = "dataset_ht786786000"
  
}

resource "google_bigquery_table" "table_ht" {
  dataset_id = google_bigquery_dataset.ds_ht.dataset_id
  table_id = "ht_table786786000"
  deletion_protection = false
}