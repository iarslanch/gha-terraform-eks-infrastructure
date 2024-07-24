provider "aws" {
  region = var.region
  #profile = "default"
}
provider "kubernetes" {
  config_path = "~/.kube/config"  # Adjust as necessary
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

