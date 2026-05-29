variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name used to tag subnets for Load Balancer Controller auto-discovery"
  type        = string
}

variable "subnets_azs" {
  description = "List of availability zones to use for subnets"
  type        = set(string)

  validation {
    condition     = length(var.subnets_azs) >= 3
    error_message = "At least three availability zones must be specified for subnets."
  }
}
