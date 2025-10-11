terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    use_path_style              = false
    endpoints = {
      s3 = "https://nyc3.digitaloceanspaces.com"
    }
    region = "us-east-1"
    bucket = "giropops-terraform-state"
    key    = "kubernetes/terraform.tfstate"
  }
}