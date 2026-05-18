output "name" {
  description = "The RDS instance name"
  value       = aws_db_instance.this.db_name
}

output "username" {
  description = "The RDS instance username"
  value       = aws_db_instance.this.username
}

output "password" {
  description = "The RDS instance password"
  value       = aws_db_instance.this.password
  sensitive   = true
}

output "endpoint" {
  description = "The RDS instance endpoint"
  value       = aws_db_instance.this.endpoint
}
