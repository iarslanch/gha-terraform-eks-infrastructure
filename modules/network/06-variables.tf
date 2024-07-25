
######################################################
#################### Network CIDR ###################
######################################################


variable "vpc_cidr" {
  description = "The cidr range for vpc"
  type        = string
}



variable "env" {}
variable "project" {}
variable "web_public_subnet01_cidr" {}
variable "web_public_subnet02_cidr" {}
variable "app_private_subnet01_cidr" {}
variable "app_private_subnet02_cidr" {}
variable "db_private_subnet01_cidr" {}
variable "db_private_subnet02_cidr" {}
variable "availability_zone1" {}
variable "availability_zone2" {}

#variable "bastion_sg" {}


variable "enable_dns_support" {}
variable "enable_dns_hostnames" {}




variable "web_public_subnet01_assign_ipv6_address_on_creation" {}
variable "web_public_subnet01_map_public_ip_on_launch" {}
variable "web_public_subnet02_assign_ipv6_address_on_creation" {}
variable "web_public_subnet02_map_public_ip_on_launch" {}
variable "app_private_subnet01_assign_ipv6_address_on_creation" {}
variable "app_private_subnet01_map_public_ip_on_launch" {}
variable "app_private_subnet02_assign_ipv6_address_on_creation" {}
variable "app_private_subnet02_map_public_ip_on_launch" {}
variable "db_private_subnet01_assign_ipv6_address_on_creation" {}
variable "db_private_subnet01_map_public_ip_on_launch" {}
variable "db_private_subnet02_assign_ipv6_address_on_creation" {}
variable "db_private_subnet02_map_public_ip_on_launch" {}


