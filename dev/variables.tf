


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

variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
}

variable "repository" {
  description = "GitHub repository to run actions"
  type        = string
}



















 

