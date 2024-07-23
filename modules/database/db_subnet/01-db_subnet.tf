resource "aws_db_subnet_group" "db_subnet_group" {
  name = "db-subnet-group-${var.env}"
  subnet_ids = [var.db_private_subnet01, var.db_private_subnet02]
  tags = {
    Terraform   = "true"
    Environment = "${var.env}"
    propagate_at_launch = true
    Name   = "db-subnet-group-${var.env}"
    
  }
}