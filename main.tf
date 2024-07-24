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
  env     = "cscontents"
  stage   = "dev"
  name    = "${local.project}-${local.env}-${local.stage}"
  region  = "us-west1"
}

# 모듈 변수
module "cscontents_module" {
  source = "../00_structure"
  gcpSubnetPub = ["10.0.0.0/24","10.0.1.0/24"]
  gcpSubnetPri = ["10.0.2.0/24","10.0.3.0/24"]
  gcp-az = ["a","b"]
  gcp-sshkey ="dlsrk489"
}

provider "google" {
  project = "teak-flash-430301-c8"
  credentials = var.gcp_credentials
  region = "us-west1"
  zone = "us-west1-a"
}

resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

