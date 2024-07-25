# Creating EKS Node Group

resource "aws_eks_node_group" "k8s_nodes" {
  cluster_name    = aws_eks_cluster.k8s_cluster.name
  node_group_name = "${var.project}-cluster-nodes-${var.env}"
  node_role_arn   = aws_iam_role.NodeGroupRole.arn
  subnet_ids      = [var.web_public_subnet01, var.web_public_subnet02]

  remote_access {
    ec2_ssh_key = var.eks_cluster_node_keypair_name
  }
  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  update_config {
    max_unavailable = 1
  }
  labels = {
    role = "general"
  }
  ami_type       = var.ami_type
  instance_types = var.instance_types
  capacity_type  = var.capacity_type
  disk_size      = var.disk_size

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy
  ]
}