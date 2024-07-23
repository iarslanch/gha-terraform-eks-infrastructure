

resource "aws_db_instance" "this" {
  #identifier             = "${var.project}-${var.application-name}-mssql-database-${var.env}"
  identifier             = "${var.database_identifier_name}-${var.env}"
  instance_class         = var.mssql_instance_class 
  allocated_storage      = var.mssql_allocated_storage
  engine                 = var.mssql_engine
  engine_version         = var.mssql_engine_version
  db_subnet_group_name   = "${var.db_subnet_group}"
 
  vpc_security_group_ids    = [ aws_security_group.default.id  ]
  publicly_accessible    = var.mssql_publicly_accessible
  skip_final_snapshot    = var.mssql_skip_final_snapshot
  backup_retention_period = var.mssql_backup_retention_period 

# username             = jsondecode(data.aws_secretsmanager_secret_version.mssql_database_secret_version.secret_string)["mssql_db_username"]
# password             = jsondecode(data.aws_secretsmanager_secret_version.mssql_database_secret_version.secret_string)["mssql_db_password"]
#Use the username and password from the secret manager  
  username = jsondecode(aws_secretsmanager_secret_version.secret_version.secret_string)["mssql_db_username"]
  password = jsondecode(aws_secretsmanager_secret_version.secret_version.secret_string)["mssql_db_password"]

  tags = {
    Name = "${var.database_identifier_name}-${var.env}"
  }
}




## DATA MODULES ##
# data "aws_secretsmanager_secret" "mssql_database_secret" {
#  name = "mssql_database_secret"
# }

# data "aws_secretsmanager_secret_version" "mssql_database_secret_version" {
#  secret_id = data.aws_secretsmanager_secret.mssql_database_secret.id
# }




