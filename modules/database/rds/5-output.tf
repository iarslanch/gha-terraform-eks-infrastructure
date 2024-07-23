

output "db_sg" {
  description = "The db security group id"
  value       = aws_security_group.default.id
}