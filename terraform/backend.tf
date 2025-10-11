terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    endpoints = {
      s3 = "https://nyc3.digitaloceanspaces.com"
    }
    region = "us-east-1" # Required but not used by DO Spaces
    bucket = "giropops-terraform-state"
    key    = "kubernetes/terraform.tfstate"
  }
}