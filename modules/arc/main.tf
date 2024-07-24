resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.8.2"

  set {
    name  = "installCRDs"
    value = "true"
  }
}

resource "helm_release" "arc" {
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
}

resource "kubernetes_namespace" "actions_runner_system" {
  metadata {
    name = "actions-runner-system"
  }
}

resource "kubernetes_secret" "arc_secret" {
  metadata {
    name      = "controller-manager"
    namespace = kubernetes_namespace.actions_runner_system.metadata[0].name
  }

  data = {
    github_token = var.github_token
  }
}

resource "kubernetes_manifest" "runner_deployment" {
  manifest = {
    apiVersion = "actions.summerwind.dev/v1alpha1"
    kind       = "RunnerDeployment"
    metadata = {
      name      = "techsol-runnerdeploy"
      namespace = kubernetes_namespace.actions_runner_system.metadata[0].name
    }
    spec = {
      replicas = 1
      template = {
        spec = {
          repository = "iarslanch/techsol-ci-gha-workflow"  # Replace with your repository
        }
      }
    }
  }
}
