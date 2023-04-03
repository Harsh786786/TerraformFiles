terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.59.0"
    }
  }
} 

provider "google" {
  # Configuration optionscd ..
  project = "linen-arch-374006"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "keys.json"
}

