output "alb_sg" {
  description = "The alb security group id"
  value       = aws_security_group.default.id
}


output "alb_dns" {
  description = "The alb DNS output"
  value       = aws_lb.this.dns_name
}



output "load_balancer_arn" {
  description = "The alb DNS output"
  value       = aws_lb.this.arn
}

