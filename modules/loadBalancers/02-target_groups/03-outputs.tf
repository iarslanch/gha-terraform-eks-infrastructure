
output "target_group_arn" {
  description = "The target group output"
  value       = aws_lb_target_group.target_group.arn
}
