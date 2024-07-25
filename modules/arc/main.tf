provider "kubernetes" {
  host                   = var.cluster_endpoint
  cluster_ca_certificate = var.cluster_ca_certificate
  token                  = var.cluster_token
}

# Install the Actions Runner Controller using Helm
resource "helm_release" "arc" {
  name       = "actions-runner-controller"
  namespace  = "actions-runner-system"
  chart      = "actions-runner-controller"
  repository = "https://actions-runner-controller.github.io/actions-runner-controller"
  version    = "0.19.1"

  create_namespace = true

  set {
    name  = "authSecret.create"
    value = "true"
  }

  set {
    name  = "authSecret.github_token"
    value = var.github_token
  }

  set {
    name  = "runnerDeployment.replicas"
    value = 1
  }
}

# Apply the RunnerDeployment resource
resource "kubernetes_manifest" "runner_deployment" {
  depends_on = [helm_release.arc]

  manifest = yamldecode(file("${path.module}/runnerdeployment.yaml"))
}

# Variables for Kubernetes provider
variable "cluster_endpoint" {
  description = "The endpoint of the Kubernetes cluster"
  type        = string
}

variable "cluster_ca_certificate" {
  description = "The base64 encoded certificate for the Kubernetes cluster"
  type        = string
}

variable "cluster_token" {
  description = "The token for the Kubernetes cluster"
  type        = string
}

# Variable for GitHub token
variable "github_token" {
  description = "GitHub token with permissions to manage runners"
  type        = string
  sensitive   = true
}
