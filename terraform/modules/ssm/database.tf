resource "aws_ssm_parameter" "database" {
  for_each = local.database_secrets_keys

  name        = "/${var.project_name}/database/${each.key}"
  description = nonsensitive(var.database_secrets[each.key].description)
  type        = "SecureString"
  value       = var.database_secrets[each.key].value
}
