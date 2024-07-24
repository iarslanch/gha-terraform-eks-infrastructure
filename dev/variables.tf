


# Region
variable "region" {
  description = "region"
  default     = "eu-west-2"
}



################# Pipeline variables ###################

variable "env" {
  description = "Environment Name Declare in Github Action Yaml"
  #default = "dev"
}
variable "project" {
  description = "Project Name Declare in Github Action Yaml"

}
variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}


















 

