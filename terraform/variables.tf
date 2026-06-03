variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "default_tags" {
  description = "Default tags for AWS resources"
  type        = map(string)
  default = {
    Environment = "Production"
  }
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "movie-rating"
}

variable "subnets_azs" {
  description = "List of availability zones to use for subnets"
  type        = set(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "instance_storage" {
  description = "Storage size for the RDS instance in GB"
  type        = number
  default     = 5
}

variable "instance_class" {
  description = "The instance class for the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "engine_version" {
  description = "The version of the database engine to use"
  type        = string
  default     = "17.10"
}

variable "db_name" {
  description = "The name of the database to create when the DB instance is created"
  type        = string
  default     = "movie_rating"
}

variable "db_username" {
  description = "The username for the database"
  type        = string
  default     = "movie-rating"
}

variable "multi_az" {
  description = "Whether to create a Multi-AZ RDS instance"
  type        = bool
  default     = false
}

variable "eks_version" {
  description = "Kubernetes version to use for the EKS cluster."
  type        = string
  default     = "1.35"
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = list(string)
  default = [
    "movie-rating",
    "movie-rating-helm-chart"
  ]
}
