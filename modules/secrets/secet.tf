resource "aws_secretsmanager_secret" "secret_name" {
  name = var.secret_name
}


# resource "aws_secretsmanager_secret_version" "secret_version" {
#   secret_id     = aws_secretsmanager_secret.secret_name.id
#   secret_string = jsonencode({
#     mssql_db_username  =  "${var.secret_key}",
#     mssql_db_password = "${var.secret_value}",
#   })
# }

resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id     = aws_secretsmanager_secret.secret_name.id
   secret_string = jsonencode(var.example)
}




# resource "aws_secretsmanager_secret_version" "example" {
#   secret_id     = aws_secretsmanager_secret.example.id
#   secret_string = jsonencode(var.example)
# }