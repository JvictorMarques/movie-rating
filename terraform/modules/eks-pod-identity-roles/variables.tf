variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "aws_load_balancer_controller_service_account_name" {
  description = "The name of the service account for AWS Load Balancer Controller"
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "cluster_autoscaler_service_account_name" {
  description = "The name of the service account for Cluster Autoscaler"
  type        = string
  default     = "cluster-autoscaler"
}

variable "external_secrets_service_account_name" {
  description = "The name of the service account for External Secrets"
  type        = string
  default     = "external-secrets"
}

variable "ebs_csi_driver_service_account_name" {
  description = "The name of the service account for EBS CSI Driver"
  type        = string
  default     = "ebs-csi-driver"
}
