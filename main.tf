terraform {
  backend "gcs" {
    bucket = "terra-bucket-01"
    prefix = "terraform/state"
  }
}

module "gke_cluster" {
  source         = "github.com/cipgen/tf-google-gke-cluster"
  GOOGLE_REGION  = var.GOOGLE_REGION
  GOOGLE_PROJECT = var.GOOGLE_PROJECT
  GKE_NUM_NODES  = 1
}

