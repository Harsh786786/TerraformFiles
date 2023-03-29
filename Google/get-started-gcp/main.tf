terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.59.0"
    }
  }
} 

provider "google" {
  # Configuration options
  project = "linen-arch-374006"
  region = "us-central1"
  zone = "us-central1-a"
}

resource google_storage_bucket "GCS786rojharsh" {
  name = "harshbucketharsh786786"
  location      = "US"
}