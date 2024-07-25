

output "cluster-name" {
  value = aws_eks_cluster.k8s_cluster.name
}
/*
outp
output cluster-sg {
  value=aws_eks_cluster.cluster.vpc_config[0].security_group_ids
}
ut ca {
  value=aws_eks_cluster.cluster.certificate_authority[0].data
}

output endpoint {
  value=aws_eks_cluster.cluster.endpoint
}

*/

# output "oidc_provider_arn" {
#   value = module.cluster.oidc_provider_arn
# }

