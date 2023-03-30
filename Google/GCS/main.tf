resource "google_storage_bucket" "GCS1" {
   name = "bucket-new-0004567890786"
   location = "US"
   storage_class = "NEARLINE"

   labels = {
     "env" = "ht"
     "dep"= "billing"
   }
   uniform_bucket_level_access = true

   lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "SetStorageClass"
      storage_class = "STANDARD"
    }
  }

  retention_policy {
    is_locked = true
    retention_period = 86000
  }
}

resource "google_storage_bucket_object" "GCSOBJ" {

    name = "Rahul_Pic"
    bucket  = google_storage_bucket.GCS1.name
    source = "image.JPG"
  
}