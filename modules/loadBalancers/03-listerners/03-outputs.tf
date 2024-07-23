

output "loadbalancer_listener_arn" {
  description = "The target group output"
  value       = aws_lb_listener.loadbalancer_listener.arn
}

