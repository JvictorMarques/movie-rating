variable "cluster_name" {
  description = "Name of the EKS cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version to use for the EKS cluster."
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for the EKS cluster."
  type        = list(string)
}

variable "node_group_name" {
  description = "Name of the EKS node group."
  type        = string
  default     = "general"
}

variable "capacity_type" {
  description = "Capacity type for the EKS node group (e.g., ON_DEMAND, SPOT), preferred ON_DEMAND."
  type        = string
  default     = "ON_DEMAND"

  validation {
    condition     = contains(["ON_DEMAND", "SPOT"], var.capacity_type)
    error_message = "capacity_type must be ON_DEMAND or SPOT."
  }
}

variable "instance_type" {
  description = "EC2 instance type for the EKS node group."
  type        = string
  default     = "t3.large"
}

variable "node_group_desired_size" {
  description = "Desired number of nodes in the EKS node group."
  type        = number
  default     = 1
}

variable "node_group_max_size" {
  description = "Maximum number of nodes in the EKS node group."
  type        = number
  default     = 10
}

variable "node_group_min_size" {
  description = "Minimum number of nodes in the EKS node group."
  type        = number
  default     = 0
}
