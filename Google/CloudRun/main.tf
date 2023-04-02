resource "google_cloud_run_service" "app-ht" {
  name = "app-ht"
  location = "asia-southeast1"


  template {
    spec {
      containers {
        
        # image = "us-docker.pkg.dev/cloudrun/container/hello@sha256:63f08b198ddc94bbdbea264315ee3820ec7f9535423dc1c0a4c6af170ac79df6"
        # image = "us-docker.pkg.dev/cloudrun/container/hello@sha256:42517c698aef1d7105a332c41381b37ce81aaafe0486a8aaf0b0d79e38b0356f"
        image = "us-docker.pkg.dev/cloudrun/container/hello@sha256:51c707699ea3fb58874d2a919e0c4fd083c01d54847ecacffb097bcc42f93c7c"
      }
    }
  }
  traffic {
    percent = 0
    latest_revision = true 
  }

  traffic {
    revision_name = "app-ht-c5bsv"
    percent = 45
  }
  traffic {
    revision_name = "app-ht-98wr9"
    percent = 55
  }

}
# ////////////////////////////////////////////////////////////////////////
resource "google_cloud_run_service_iam_binding" "binding" {
  service = google_cloud_run_service.app-ht.name
  location = "asia-southeast1"
  role = "roles/run.invoker"
  members = [
    "allUsers"
  ]
  
}
# /////////////////////////////////////////////////////////////////////////////
# ////////////////////////////////////////////////////////////////////////////
# resource "google_cloud_run_service_iam_policy" "alluser" {
#   service = google_cloud_run_service.app-ht.name
#   location = "asia-southeast1"
#   policy_data = data.google_iam_policy.alluser-data-binding.policy_data

# }
# data "google_iam_policy" "alluser-data-binding" {
#   binding {
#     role = "roles/run.invoker"
#     members = [ "allUsers" ]
#   }
# }
# //////////////////////////////////////////////////////////////////////////////////////