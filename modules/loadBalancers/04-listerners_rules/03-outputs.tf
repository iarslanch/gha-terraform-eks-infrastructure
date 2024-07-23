

output "listener_rules_arn" {
  description = "Arn OF Listener Rules"
  value       = aws_lb_listener_rule.rules.arn
}
