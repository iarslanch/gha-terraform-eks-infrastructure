# ------------------------------------------------------------------------------
# PUBLIC SUBNETS fOR WEB
# ------------------------------------------------------------------------------

resource "aws_subnet" "web_public_subnet01" {
  vpc_id                          = aws_vpc.this.id
  cidr_block                      = var.web_public_subnet01_cidr
  assign_ipv6_address_on_creation  = var.web_public_subnet01_assign_ipv6_address_on_creation
  availability_zone                 = var.availability_zone1
  map_public_ip_on_launch         = var.web_public_subnet01_map_public_ip_on_launch
  timeouts {}
  tags = {
    #Name = "web-public-subnet01-${var.env}"
    Terraform   = "true"
    Environment = "${var.env}"
    propagate_at_launch = true
    Name                                      = "public-subnet01-${var.env}"
    "kubernetes.io/role/elb"           = "1"
    "kubernetes.io/cluster/${var.project}-cluster-${var.env}" = "owned"
  
    
  }
}

resource "aws_subnet" "web_public_subnet02" {
  vpc_id                          = aws_vpc.this.id
  assign_ipv6_address_on_creation = var.web_public_subnet02_assign_ipv6_address_on_creation
  cidr_block                      = var.web_public_subnet02_cidr
  availability_zone               = var.availability_zone2
  map_public_ip_on_launch         = var.web_public_subnet02_map_public_ip_on_launch
  timeouts {}
  tags = {
    Terraform   = "true"
    Environment = "${var.env}"
    propagate_at_launch = true
    Name                                      = "public-subnet02-${var.env}"
    "kubernetes.io/role/elb"           = "1"
    "kubernetes.io/cluster/${var.project}-cluster-${var.env}" = "owned"
  
    
  }

}





# ------------------------------------------------------------------------------
# PRIVATE SUBNETS FOR APPLICATION
# ------------------------------------------------------------------------------


resource "aws_subnet" "app_private_subnet01" {
  vpc_id                          = aws_vpc.this.id
  assign_ipv6_address_on_creation = var.app_private_subnet01_assign_ipv6_address_on_creation
  cidr_block                      = var.app_private_subnet01_cidr
  availability_zone               = var.availability_zone1
  map_public_ip_on_launch         = var.app_private_subnet01_map_public_ip_on_launch
  timeouts {}
  tags = {
    Terraform   = "true"
    Environment = "${var.env}"
    propagate_at_launch = true
    "Name"                                      = "private-subnet01-${var.env}"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.project}-cluster-${var.env}" = "owned"
  
    
  }
}

resource "aws_subnet" "app_private_subnet02" {
  vpc_id                          = aws_vpc.this.id
  assign_ipv6_address_on_creation = var.app_private_subnet02_assign_ipv6_address_on_creation
  cidr_block                      = var.app_private_subnet02_cidr
  availability_zone               = var.availability_zone2
  map_public_ip_on_launch         = var.app_private_subnet02_map_public_ip_on_launch
  timeouts {}
   tags = {
    
    "Name"                                      = "private-subnet02-${var.env}"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.project}-cluster-${var.env}" = "owned"
    Environment = "${var.env}"
    propagate_at_launch = true
    Terraform   = "true"
  }
}




resource "aws_subnet" "db_private_subnet01" {
  vpc_id                          = aws_vpc.this.id
  assign_ipv6_address_on_creation = var.db_private_subnet01_assign_ipv6_address_on_creation
  cidr_block                      = var.db_private_subnet01_cidr
  availability_zone               = var.availability_zone1
  map_public_ip_on_launch         = var.db_private_subnet01_map_public_ip_on_launch
  timeouts {}
   tags = {
    Terraform   = "true"
    Environment = "${var.env}"
    propagate_at_launch = true
    "Name"                                      = "db-private-subnet01-${var.env}"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.project}-cluster-${var.env}" = "owned"
  
    
  }
}

resource "aws_subnet" "db_private_subnet02" {
  vpc_id                          = aws_vpc.this.id
  assign_ipv6_address_on_creation = var.db_private_subnet02_assign_ipv6_address_on_creation
  cidr_block                      = var.db_private_subnet02_cidr
  availability_zone               = var.availability_zone2
  map_public_ip_on_launch         = var.db_private_subnet02_map_public_ip_on_launch
   tags = {
    Terraform   = "true"
    Environment = "${var.env}"
    propagate_at_launch = true
    Name                                      = "db-private-subnet02-${var.env}"
    "kubernetes.io/role/internal-elb"           = "1"
    "kubernetes.io/cluster/${var.project}-cluster-${var.env}" = "owned"
  
    
  }
}
