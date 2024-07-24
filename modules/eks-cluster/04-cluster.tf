resource "aws_eks_cluster" "k8s_cluster" {
  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler",
  ]

  name     = "${var.project}-cluster-${var.env}"
  role_arn = aws_iam_role.EKSClusterRole.arn
  version  = var.eks_version
  timeouts {}

  vpc_config {
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    security_group_ids = [aws_security_group.default.id]
    #public_access_cidrs     = ["0.0.0.0/0", ]
    public_access_cidrs = var.public_access_cidrs
    subnet_ids          = [var.web_public_subnet01, var.web_public_subnet02]

  }

  depends_on = [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy]

  tags = {
    Name                = "${var.project}-cluster-${var.env}"
    Terraform           = "true"
    Environment         = "${var.env}"
    propagate_at_launch = true
  }
}


### OIDC config
# resource "aws_iam_openid_connect_provider" "cluster" {
#   client_id_list  = ["sts.amazonaws.com"]
#   thumbprint_list = []
#   url             = aws_eks_cluster.eks-cluster.identity.0.oidc.0.issuer
# }