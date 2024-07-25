provider "kubernetes" {
  host                   = var.cluster_endpoint
  cluster_ca_certificate = var.cluster_ca_certificate
  token                  = var.cluster_token
}

# Install Helm
resource "null_resource" "install_helm" {
  provisioner "local-exec" {
    command = <<EOT
      curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
    EOT
  }
}

# Add the Actions Runner Controller Helm repository
resource "null_resource" "add_helm_repo" {
  provisioner "local-exec" {
    command = <<EOT
      helm repo add actions-runner-controller https://actions-runner-controller.github.io/actions-runner-controller && \
      helm repo update
    EOT
  }
  depends_on = [null_resource.install_helm]
}

# Install the Actions Runner Controller using Helm
resource "helm_release" "actions_runner_controller" {
  depends_on = [null_resource.add_helm_repo]

  name       = "actions-runner-controller"
  repository = "https://actions-runner-controller.github.io/actions-runner-controller"
  chart      = "actions-runner-controller"
  namespace  = "actions-runner-system"
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
    value = 2
  }
}

# Wait for the Actions Runner Controller CRDs to register
resource "null_resource" "wait_for_crd_registration" {
  provisioner "local-exec" {
    command = "sleep 30"
  }
  depends_on = [helm_release.actions_runner_controller]
}

# Apply the RunnerDeployment resource
resource "kubernetes_manifest" "runner_deployment" {
  depends_on = [null_resource.wait_for_crd_registration]

  manifest = {
    apiVersion = "actions.summerwind.dev/v1alpha1"
    kind       = "RunnerDeployment"
    metadata = {
      name      = "poc-runnerdeploy"
      namespace = "actions-runner-system"
    }
    spec = {
      replicas = 2
      template = {
        spec = {
          repository = "iarslanch/techsol-ci-gha-workflow"
        }
      }
    }
  }
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
