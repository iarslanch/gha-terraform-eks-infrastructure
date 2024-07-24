
variable "web_public_subnet01" {}
variable "web_public_subnet02" {}
#variable "cluster_security_group" {}
#variable "db_sg" {}
######################################################
########################  Cluster  #################
######################################################
#variable "cluster_name" {}
variable "eks_version" {}
variable "endpoint_private_access" {}
variable "endpoint_public_access" {}
variable "public_access_cidrs" {}

######################################################
######################## Nodes Nodes #################
######################################################
variable "eks_cluster_node_keypair_name" {}
variable "ami_type" {}
variable "instance_types" {}
variable "capacity_type" {}
variable "disk_size" {}
variable "desired_size" {}
variable "max_size" {}
variable "min_size" {}

######################################################
######################## Cluster IAM #################
######################################################
# variable "cluster_oidc_issuer_url" {
#   type = string
# }

variable "vpc_id" {}
variable "env" {}
variable "project" {}





 #### ECS EC2 Security Groups Ports ####


variable "tcp_ports" {
  description = "List of TCP ports"
  type        = list(string)
  default     = ["22", "80", "443"]
}

variable "udp_ports" {
  description = "List of UDP ports"
  type        = list(string)
  default     = []
}

variable "cidrs" {
  description = "List of CIDR blocks"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
