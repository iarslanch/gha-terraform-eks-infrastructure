

####*******************************************************####
###                   Network Module                        ###
####*******************************************************####

module "network" {
source                          = "../modules/network"                            
 # vpc Configuration
   vpc_cidr                     = "72.11.0.0/20"
   enable_dns_support           = true
   enable_dns_hostnames         = true

 # Public Subnet 1 Configuration
   web_public_subnet01_cidr                             = "72.11.1.0/24" 
   web_public_subnet01_assign_ipv6_address_on_creation  = false
   web_public_subnet01_map_public_ip_on_launch          = true
   
 # Public Subnet 2 Configuration
  web_public_subnet02_cidr                              = "72.11.2.0/24"
  web_public_subnet02_assign_ipv6_address_on_creation   = false
  web_public_subnet02_map_public_ip_on_launch           = true

 # Private Subnet 1 Configuration
  app_private_subnet01_cidr                             = "72.11.4.0/22"
  app_private_subnet01_assign_ipv6_address_on_creation  = false
  app_private_subnet01_map_public_ip_on_launch          = false

 # Private Subnet 2 Configuration
  app_private_subnet02_cidr                             = "72.11.8.0/22"   
  app_private_subnet02_assign_ipv6_address_on_creation  = false
  app_private_subnet02_map_public_ip_on_launch          = false

 # Private Data Base Subnet 1 Configuration
  db_private_subnet01_cidr                              = "72.11.12.0/24" 
  db_private_subnet01_assign_ipv6_address_on_creation   = false
  db_private_subnet01_map_public_ip_on_launch           = false

 # Private Data Base Subnet 2 Configuration
  db_private_subnet02_cidr                              = "72.11.14.0/24" 
  db_private_subnet02_assign_ipv6_address_on_creation   = false
  db_private_subnet02_map_public_ip_on_launch           = false
    
 # Subnets Availability Configuration
  availability_zone1                        =     "us-east-1a"                                  
  availability_zone2                        =     "us-east-1b"                                  
  project                                   =     var.project                              
  env                                       =     var.env      





   
  
  
}



### EKS Cluster #####

module "eks-cluster" {
 source                  = "../modules/eks-cluster"
  # EKS Cluster Configuration
   vpc_id                  = module.network.vpc_id
   web_public_subnet01     = module.network.web_public_subnet01
   web_public_subnet02     = module.network.web_public_subnet02
   eks_version             = "1.29"
   endpoint_private_access = true
   endpoint_public_access  = true
   public_access_cidrs     = ["0.0.0.0/0"]
   project                 = var.project
   env                     = var.env
# EKS Cluster Nodes Configuration
   eks_cluster_node_keypair_name = "terraform-eks"
   ami_type                      = "AL2_x86_64"
   instance_types                = ["t2.medium"]
   capacity_type                 = "ON_DEMAND"
   disk_size                     = 20
 
# EKS Cluster Nodes AutoScaling Configuration
   desired_size = 1
   max_size     = 1
   min_size     = 1

# EKS Cluster Security Group Configuration
   tcp_ports =  "22,80,443"
   cidrs     =  ["0.0.0.0/0", "0.0.0.0/0", "0.0.0.0/0", "10.0.0.200/32"]
}
resource "aws_instance" "bastion" {
  ami                    = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 AMI (example)
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
  source      = "./modules/arc"
  github_token = var.github_token
}

data "aws_eks_cluster" "this" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = var.cluster_name
}


