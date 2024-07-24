variable "region" {
  description = "The AWS region where resources will be deployed"
  default     = "eu-west-2"
}

variable "env" {
  description = "Environment Name, e.g., dev, staging, production"
  default     = "dev"  # You can remove this default if you prefer to set it elsewhere
}

variable "project" {
  description = "Project Name"
  default     = "poc"  # You can remove this default if you prefer to set it elsewhere
}

variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "poc-cluster-dev"  # Set a default or specify it in terraform.tfvars
}
