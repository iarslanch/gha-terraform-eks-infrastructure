

variable "env" {}
variable "vpc_id"{}
variable "target_group_name" {}
variable "target_port" {}
variable "target_protocol" {}
variable "target_type" {}         
variable "target_connection_termination" {}
variable "target_lambda_multi_value_headers_enabled" {}
variable "target_health_check_interval" {}
variable "target_health_check_path" {}
variable "target_health_check_protocol" {}
variable "target_health_check_timeout" {}
variable "target_health_check_healthy_threshold"  {}
variable "target_health_check_unhealthy_threshold" {}
variable "load_balancer_arn" {}
 