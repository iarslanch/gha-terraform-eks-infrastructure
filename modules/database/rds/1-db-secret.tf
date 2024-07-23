

resource "aws_secretsmanager_secret" "secret" {
  name = "${var.secret_name}"
}


resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = jsonencode({
    mssql_db_username  =  "${var.mssql_db_username}",
    mssql_db_password = "${var.mssql_db_password}",
  })
}


