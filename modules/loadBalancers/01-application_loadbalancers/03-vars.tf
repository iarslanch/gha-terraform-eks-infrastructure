variable "web_public_subnet01" {}
variable "web_public_subnet02" {}
variable "vpc_id"{}
variable "env" {}
variable "alb_name" {}
variable "aws_lb_internal_values" {}
variable "enable_deletion_protection" {}
variable "idle_timeout" {}
variable "load_balancer_type" {}
variable "ip_address_type" {}



variable "tcp_ports" {
  default = "default_null"
}

variable "udp_ports" {
  default = "default_null"
}

variable "cidrs" {
  type = list

}