




# output "example" {
#   value = {
#     key1 = jsondecode(aws_secretsmanager_secret_version.secret_version.secret_string)["key1"]
#     key2 = jsondecode(aws_secretsmanager_secret_version.secret_version.secret_string)["key2"]
#   }
# }





output "example" {
  value = {
    key1 = jsondecode(aws_secretsmanager_secret_version.secret_version.secret_string)["mssql_db_username"]
    key2 = jsondecode(aws_secretsmanager_secret_version.secret_version.secret_string)["mssql_db_password"]
  }
}

