output "db_subnet_group" {
  description = "DB Subnet Group id"
  value       = aws_db_subnet_group.db_subnet_group.id
}
