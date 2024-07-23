terraform {
  backend "s3" {
    bucket  = "gha-state-file-terraform"
    key     = "dev/terraform.tfstate"
    region  = "eu-west-2"
    profile = "terraform"
  }
}