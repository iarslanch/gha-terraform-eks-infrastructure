
####*******************************************************####
###                   Network Module                        ###
####*******************************************************####

module "network" {
  source                          = "../modules/network"                            
  vpc_cidr                        = "72.11.0.0/20"
  enable_dns_support              = true
  enable_dns_hostnames            = true

  web_public_subnet01_cidr                             = "72.11.1.0/24" 
  web_public_subnet01_assign_ipv6_address_on_creation  = false
  web_public_subnet01_map_public_ip_on_launch          = true
  
  web_public_subnet02_cidr                              = "72.11.2.0/24"
  web_public_subnet02_assign_ipv6_address_on_creation   = false
  web_public_subnet02_map_public_ip_on_launch           = true

  app_private_subnet01_cidr                             = "72.11.4.0/22"
  app_private_subnet01_assign_ipv6_address_on_creation  = false
  app_private_subnet01_map_public_ip_on_launch          = false

  app_private_subnet02_cidr                             = "72.11.8.0/22"   
  app_private_subnet02_assign_ipv6_address_on_creation  = false
  app_private_subnet02_map_public_ip_on_launch          = false

  db_private_subnet01_cidr                              = "72.11.12.0/24" 
  db_private_subnet01_assign_ipv6_address_on_creation   = false
  db_private_subnet01_map_public_ip_on_launch           = false
}

####*******************************************************####
###                EKS Cluster Module                      ###
####*******************************************************####

module "eks_cluster" {
  source = "../modules/eks-cluster"
  
  cluster_name = var.cluster_name

  # EKS Cluster Configuration
  eks_version = "1.21"
  eks_cluster_role_arn = "arn:aws:iam::123456789012:role/eks-cluster-role"
  vpc_id = module.network.vpc_id
  subnet_ids = module.network.subnet_ids

  # EKS Cluster Nodes Configuration
  eks_cluster_node_keypair_name = "techsoland"
  ami_type                      = "AL2_x86_64"
  instance_types                = ["t2.medium"]
  capacity_type                 = "ON_DEMAND"
  disk_size                     = 30

  desired_size = 1
  max_size     = 1
  min_size     = 1

  # EKS Cluster Security Group Configuration
  tcp_ports = "22,80,443"
  cidrs     = ["0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0", "10.0.0.200/32"]
}

####*******************************************************####
###                Bastion Host and Security Group         ###
####*******************************************************####

resource "aws_instance" "bastion" {
  ami                    = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI (example)
  instance_type          = "t2.micro"
  key_name               = "techsoland"
  subnet_id              = module.network.public_subnet_id
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
  source = "../modules/arc"

  github_token = var.github_token
}


