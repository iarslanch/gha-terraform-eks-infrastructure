resource "aws_security_group" "default" {
  name        = "${var.project}-eks-cluster-sg-${var.env}"
  description = "Default security group for the EKS cluster"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.project}-eks-cluster-sg-${var.env}"
    Environment = var.env
    Terraform   = "true"
  }
}
