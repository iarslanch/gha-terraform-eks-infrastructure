resource "helm_release" "arc" {
  name       = "actions-runner-controller"
  repository = "https://actions-runner-controller.github.io/actions-runner-controller"
  chart      = "actions-runner-controller"
  namespace  = "actions-runner-system"

  set {
    name  = "authSecret.create"
    value = true
  }

  set {
    name  = "authSecret.github_token"
    value = var.github_token
  }
}

resource "kubernetes_manifest" "arc_runnerdeployment" {
  manifest = {
    apiVersion = "actions.summerwind.dev/v1alpha1"
    kind       = "RunnerDeployment"
    metadata = {
      name = "techsol-runnerdeploy"
    }
    spec = {
      replicas = 1
      template = {
        spec = {
          repository = var.repository
        }
      }
    }
  }
}
