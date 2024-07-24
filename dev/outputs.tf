
output "eks_cluster_endpoint" {
  description = "EKS Cluster endpoint"
  value       = module.eks_cluster.endpoint
}

output "eks_cluster_certificate_authority_data" {
  description = "EKS Cluster Certificate Authority Data"
  value       = module.eks_cluster.certificate_authority_data
}

output "eks_cluster_arn" {
  description = "EKS Cluster ARN"
  value       = module.eks_cluster.cluster_arn
}

output "eks_cluster_security_group_id" {
  description = "Security group ID attached to the EKS cluster"
  value       = module.eks_cluster.cluster_security_group_id
}

output "eks_node_group_arns" {
  description = "EKS Node Group ARNs"
  value       = module.eks_cluster.node_group_arns
}
output "arc_runner_deployment_status" {
  description = "Status of the ARC runner deployment"
  value       = module.arc.runner_deployment_status
}


