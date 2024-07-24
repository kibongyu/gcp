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

# 로컬 변수
locals {
  project = "cloudexperience"
  env     = "wgpark"
  stage   = "dev"
  name    = "${local.project}-${local.env}-${local.stage}"
  region  = "asia-northeast3"
}

provider "google" {
  project = "teak-flash-430301-c8"
  credentials = var.gcp_credentials
  region = "europe-west1"
  zone = "europe-west1-a"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

