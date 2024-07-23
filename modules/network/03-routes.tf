
# ------------------------------------------------------------------------------
# PUBLIC ROUTE TABLES FOR WEB SUBNET
# ------------------------------------------------------------------------------

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id

  }
  tags = {
    Name = "public-route-table-${var.env}"
    Terraform   = "true"
    Environment = "${var.env}"
    propagate_at_launch = true
  }
 }



# ------------------------------------------------------------------------------
# PUBLIC ROUTE TABLES ASSOCIATION WITH PUBLIC SUBNET
# ------------------------------------------------------------------------------


resource "aws_route_table_association" "public_subnet01" {
  subnet_id      = aws_subnet.web_public_subnet01.id
  route_table_id = aws_route_table.public_route_table.id

}

resource "aws_route_table_association" "public_subnet02" {
  subnet_id      = aws_subnet.web_public_subnet02.id
  route_table_id = aws_route_table.public_route_table.id

}


# ------------------------------------------------------------------------------
# PRIVATE ROUTE TABLES
# ------------------------------------------------------------------------------



resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

 tags = {
    Name = "private-route-table-${var.env}"
    Terraform   = "true"
    Environment = "${var.env}"
    propagate_at_launch = true
  }
}


# ------------------------------------------------------------------------------
# Private ROUTE TABLES ASSOCIATION WITH Private SUBNET
# ------------------------------------------------------------------------------

resource "aws_route_table_association" "app_private_subnet01" {
  subnet_id      = aws_subnet.app_private_subnet01.id
  route_table_id = aws_route_table.private_route_table.id
}


resource "aws_route_table_association" "app_private_subnet02" {
  subnet_id      = aws_subnet.app_private_subnet02.id
  route_table_id = aws_route_table.private_route_table.id
}



resource "aws_route_table_association" "db_private_subnet01" {
  subnet_id      = aws_subnet.db_private_subnet01.id
  route_table_id = aws_route_table.private_route_table.id
}


resource "aws_route_table_association" "db_private_subnet02" {
  subnet_id      = aws_subnet.db_private_subnet02.id
  route_table_id = aws_route_table.private_route_table.id
}