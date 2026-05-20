output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = aws_subnet.private[*].id
}

output "id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}
