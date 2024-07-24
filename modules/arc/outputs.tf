output "runner_deployment_status" {
  description = "Status of the Runner Deployment"
  value       = kubernetes_manifest.runner_deployment.status
}
