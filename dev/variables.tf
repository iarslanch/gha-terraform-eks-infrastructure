variable "region" {
  description = "region"
  default     = "eu-west-2"
}

variable "env" {
  description = "Environment Name Declare in Github Action Yaml"
  default     = "dev"  # or remove default and ensure it is set elsewhere
}

variable "project" {
  description = "Project Name Declare in Github Action Yaml"
  default     = "poc"  # or remove default and ensure it is set elsewhere
}

variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}