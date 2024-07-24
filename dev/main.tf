# Provider configuration
provider "aws" {
  region = var.region
}

locals {
  cluster_name = "${var.project}-cluster-${var.env}"
}

data "aws_eks_cluster" "this" {
  name = "${var.project}-cluster-${var.env}
}

data "aws_eks_cluster_auth" "this" {
  name = data.aws_eks_cluster.this.name
}

module "network" {
  source                          = "../modules/network"
  vpc_cidr                        = "72.11.0.0/20"
  enable_dns_support              = true
  enable_dns_hostnames            = true

  web_public_subnet01_cidr                             = "72.11.1.0/24"
  web_public_subnet01_assign_ipv6_address_on_creation  = false
  web_public_subnet01_map_public_ip_on_launch          = true
  
  web_public_subnet02_cidr                             = "72.11.2.0/24"
  web_public_subnet02_assign_ipv6_address_on_creation  = false
  web_public_subnet02_map_public_ip_on_launch          = true

  app_private_subnet01_cidr                            = "72.11.4.0/22"
  app_private_subnet01_assign_ipv6_address_on_creation = false
  app_private_subnet01_map_public_ip_on_launch         = false

  app_private_subnet02_cidr                            = "72.11.8.0/22"
  app_private_subnet02_assign_ipv6_address_on_creation = false
  app_private_subnet02_map_public_ip_on_launch         = false

  db_private_subnet01_cidr                             = "72.11.12.0/24"
  db_private_subnet01_assign_ipv6_address_on_creation  = false
  db_private_subnet01_map_public_ip_on_launch          = false

  db_private_subnet02_cidr                             = "72.11.14.0/24"
  db_private_subnet02_assign_ipv6_address_on_creation  = false
  db_private_subnet02_map_public_ip_on_launch          = false

  availability_zone1                                   = "eu-west-2a"
  availability_zone2                                   = "eu-west-2b"
  project                                              = var.project
  env                                                  = var.env
}

module "eks-cluster" {
  source                  = "../modules/eks-cluster"
  vpc_id                  = module.network.vpc_id
  web_public_subnet01     = module.network.web_public_subnet01
  web_public_subnet02     = module.network.web_public_subnet02
  eks_version             = "1.29"
  endpoint_private_access = true
  endpoint_public_access  = true
  public_access_cidrs     = ["0.0.0.0/0"]
  project                 = var.project
  env                     = var.env
  eks_cluster_node_keypair_name = "terraform-eks"
  ami_type                      = "AL2_x86_64"
  instance_types                = ["t2.medium"]
  capacity_type                 = "ON_DEMAND"
  disk_size                     = 20
  desired_size                  = 1
  max_size                      = 1
  min_size                      = 1
  tcp_ports                     = ["22", "80", "443"]
  cidrs                         = ["0.0.0.0/0"]
}

resource "aws_instance" "bastion" {
  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = "t2.micro"
  key_name               = "techsoland"
  subnet_id              = module.network.web_public_subnet01
  associate_public_ip_address = true

  tags = {
    Name = "BastionHost"
  }
}

resource "aws_security_group" "bastion_sg" {
  vpc_id = module.network.vpc_id
  description = "Allow SSH and other required traffic to Bastion host"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "BastionSG"
  }
}

module "arc" {
  source       = "../modules/arc"
  github_token = var.github_token

  # Pass necessary data for Kubernetes provider
  cluster_endpoint = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
  cluster_token = data.aws_eks_cluster_auth.this.token
}

