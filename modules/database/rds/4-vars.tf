
variable "env" {}                            # Get value from Pipeline
variable "project" {}                        # Get value from Pipeline
variable "mssql_db_username" {}              # Get value from Pipeline
variable "mssql_db_password" {}              # Get value from Pipeline
variable "vpc_id" {}                         # Get value from network Module
variable "db_subnet_group" {}                # Get value from dbsubnet Module
variable "mssql_engine" {}                   # Get value from Terrafrom.tfvars
variable "mssql_engine_version" {}           # Get value from Terrafrom.tfvars
variable "mssql_instance_class" {}           # Get value from Terrafrom.tfvars
variable "mssql_allocated_storage" {}        # Get value from Terrafrom.tfvars  
variable "mssql_publicly_accessible" {}      # Get value from Terrafrom.tfvars 
variable "mssql_skip_final_snapshot" {}      # Get value from Terrafrom.tfvars
variable "mssql_backup_retention_period" {}  #Get value from Terrafrom.tfvars
variable "database_identifier_name" {
  
}

  
variable "secret_name" {}

variable "tcp_ports" {
  default = "default_null"
}

variable "udp_ports" {
  default = "default_null"
}

variable "cidrs" {
  type = list

}













# variable "application-name" {

# description = "infrastructure name"
#     type = string
#     default = "backend"

# }
