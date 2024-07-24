terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

variable "gcp_credentials" {
  type = string
  sensitive = true
  description = "Google Cloud service account credentials"
}

provider "google" {
  project = "teak-flash-430301-c8"
  credentials = var.gcp_credentials
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

