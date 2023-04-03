#create bucket
# upload zip file that contains our code
# create cloud function
# create policy binding

resource "google_storage_bucket" "htbuck" {
  name = "htbucket786000"
  location = "US"
}
resource "google_storage_bucket_object" "srccode" {
  name = "index.zip"
  bucket = google_storage_bucket.htbuck.id
  source = "index.zip"
  
}
resource "google_cloudfunctions_function" "ht-fun" {
  name = "ht-fun"
  runtime = "nodejs18"  
  description = "This is by ht function"

  available_memory_mb = 128
  source_archive_bucket = google_storage_bucket.htbuck.name
  source_archive_object = google_storage_bucket_object.srccode.name
  trigger_http = true 
  entry_point = "helloWorldtf"
}

# resource "google_cloudfunctions_function_iam_member" "rolesmember" {
#    region = google_cloudfunctions_function.ht-fun.region
#    cloud_function = google_cloudfunctions_function.ht-fun.name
#    role = "roles/cloudfunctions.invoker"
#    member = "allUsers"

# }

resource "google_cloudfunctions_function_iam_binding" "rolebind" {
  region = google_cloudfunctions_function.ht-fun.region
  cloud_function = google_cloudfunctions_function.ht-fun.id
  role = "roles/cloudfunctions.invoker"
  members = [ "allUsers" ]
}