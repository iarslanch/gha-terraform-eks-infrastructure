variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
}

variable "repository" {
  description = "GitHub repository to run actions"
  type        = string
}

variable "kubernetes_host" {
  description = "The Kubernetes cluster host"
  type        = string
}

variable "kubernetes_token" {
  description = "The Kubernetes cluster token"
  type        = string
  sensitive   = true
}

variable "kubernetes_ca_certificate" {
  description = "The Kubernetes cluster CA certificate"
  type        = string
}
