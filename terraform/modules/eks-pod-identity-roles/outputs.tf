output "aws_load_balancer_controller_service_account_name" {
  value = var.aws_load_balancer_controller_service_account_name
}

output "cluster_autoscaler_service_account_name" {
  value = var.cluster_autoscaler_service_account_name
}

output "external_secrets_service_account_name" {
  value = var.external_secrets_service_account_name
}

output "ebs_csi_driver_service_account_role_arn" {
  value = aws_iam_role.ebs_csi_driver.arn
}
