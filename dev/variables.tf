
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

variable "endpoint_private_access" {
  description = "Whether to enable private access to the EKS cluster endpoint"
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Whether to enable public access to the EKS cluster endpoint"
  type        = bool
  default     = true
}

variable "public_access_cidrs" {
  description = "CIDR blocks allowed to access the EKS cluster"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "web_public_subnet01" {
  description = "ID of the first public subnet for the EKS cluster"
  type        = string
}

variable "web_public_subnet02" {
  description = "ID of the second public subnet for the EKS cluster"
  type        = string
}

