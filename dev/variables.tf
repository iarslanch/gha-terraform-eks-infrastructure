
# Region
variable "region" {
  description = "region"
  default     = "eu-west-2"
}

# EKS Cluster Name
variable "cluster_name" {
  description = "Name of the EKS Cluster"
  default     = "techsol"
}

################# Pipeline variables ###################

variable "env" {
  description = "Environment Name Declare in Github Action Yaml"
  #default = "dev"
}
variable "project" {
  description = "Project Name Declare in Github Action Yaml"
}
variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "techsol"
}

# Add other necessary variables as needed
