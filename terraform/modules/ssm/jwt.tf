resource "random_password" "jwt_secret_key" {
  length           = 32
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_ssm_parameter" "jwt_secret_key" {
  name        = "/${var.project_name}/jwt_secret_key"
  description = "JWT secret key for ${var.project_name} application."
  type        = "SecureString"
  value       = random_password.jwt_secret_key.result
}
