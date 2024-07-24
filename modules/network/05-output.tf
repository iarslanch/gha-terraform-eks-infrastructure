

output "web_public_subnet01" {
  description = "The public subnet 01"
  value       = aws_subnet.web_public_subnet01.id
}

output "web_public_subnet02" {
  description = "The public subnet 02"
  value       = aws_subnet.web_public_subnet02.id
}

output "app_private_subnet01" {
  description = "The private subnet 01"
 value       = aws_subnet.app_private_subnet01.id
}

output "app_private_subnet02" {
  description = "The private subnet 02"
  value       = aws_subnet.app_private_subnet02.id
}

output "db_private_subnet01" {
  description = "The db subnet 01"
  value       = aws_subnet.db_private_subnet01.id
}

output "db_private_subnet02" {
  description = "The db subnet 02"
  value       = aws_subnet.db_private_subnet02.id
}




output "vpc_id" {
    value = aws_vpc.this.id
}







# output "web_public_subnets" {
#     value = [
#       aws_subnet.web_public_subnet01.id,
#       aws_subnet.web_public_subnet02.id
#       ]
# }

