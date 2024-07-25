provider "kubernetes" {
  host                   = var.cluster_endpoint
  cluster_ca_certificate = var.cluster_ca_certificate
  token                  = var.cluster_token
}

resource "helm_release" "actions_runner_controller" {
  name             = "actions-runner-controller"
  repository       = "https://actions-runner-controller.github.io/actions-runner-controller"
  chart            = "actions-runner-controller"
  namespace        = "actions-runner-system"
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

resource "kubernetes_manifest" "runner_deployment" {
  depends_on = [helm_release.actions_runner_controller]

  manifest = {
    apiVersion = "actions.summerwind.dev/v1alpha1"
    kind       = "RunnerDeployment"
    metadata = {
      name      = "poc-ciframework-runnerdeploy"
      namespace = "arc-actions"
    }
    spec = {
      replicas = 1
      template = {
        spec = {
          repository = "iarslanch/techsol-ci-gha-workflow"
          labels     = ["self-hosted", "linux"]
        }
      }
    }
  }
}
