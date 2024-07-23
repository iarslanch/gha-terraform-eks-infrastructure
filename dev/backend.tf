terraform {
  backend "s3" {
    bucket  = "state-file-terraform-demo"
    key     = "dev/terraform.tfstate"
    region  = "us-east-1"
    profile = "terraform"
  }
}