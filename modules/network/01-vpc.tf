

resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "${var.enable_dns_support}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"

  tags = {
    Name = "${var.env}-vpc"
    Terraform   = "true"
    Environment = "${var.env}"
    propagate_at_launch = true
  }

 }
 

 resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "igw-${var.env}"
    Terraform   = "true"
    Environment = "${var.env}"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }

}

# ------------------------------------------------------------------------------
# NAT GATEWAYS FOR WEB SUBNET
# ------------------------------------------------------------------------------

resource "aws_eip" "this" {
  depends_on = [aws_internet_gateway.this]
  tags = {
    Name = "eip-private-subnets-${var.env}"
    Terraform   = "true"
    Environment = "${var.env}"
    propagate_at_launch = true
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.web_public_subnet01.id 
  depends_on    = [aws_internet_gateway.this]

  tags = {
    Name = "nat-gateway-${var.env}"
    Terraform   = "true"
    Environment = "${var.env}"
    propagate_at_launch = true
  }
}

