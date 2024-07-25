variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

variable "cluster_endpoint" {
  description = "Kubernetes cluster API endpoint"
  type        = string
}

variable "cluster_ca_certificate" {
  description = "Kubernetes cluster CA certificate"
  type        = string
}

variable "cluster_token" {
  description = "Token for authenticating to the Kubernetes cluster"
  type        = string
}
