


# Region
variable "region" {
  description = "region"
  default     = "eu-west-2"
}



################# Pipeline variables ###################

variable "project" {
  description = "Project Name Declare in Github Action Yaml"
  default     = "poc"
}

variable "env" {
  description = "Environment Name Declare in Github Action Yaml"
  default     = "dev"
}
variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "${var.project}-cluster-${var.env}"  # Replace with your default value
}


variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}


















 

