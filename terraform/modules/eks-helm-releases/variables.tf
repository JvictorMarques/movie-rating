variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster is deployed"
  type        = string
}

variable "aws_load_balancer_controller_service_account_name" {
  description = "The name of the service account for AWS Load Balancer Controller"
  type        = string
}

variable "cluster_autoscaler_service_account_name" {
  description = "The name of the service account for Cluster Autoscaler"
  type        = string
}

variable "external_secrets_service_account_name" {
  description = "The name of the service account for External Secrets"
  type        = string
}
