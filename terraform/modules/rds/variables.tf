variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "instance_storage" {
  description = "Storage size for the RDS instance in GB (for production set a value for this variable)"
  type        = number
  default     = 5
}

variable "instance_class" {
  description = "The instance class for the RDS instance (for production pick a larger instance class)"
  type        = string
  default     = "db.t3.micro"
}

variable "engine_version" {
  description = "The version of the database engine to use"
  type        = string
}

variable "db_name" {
  description = "The name of the database to create when the DB instance is created"
  type        = string
}

variable "db_username" {
  description = "The username for the database"
  type        = string
}

variable "multi_az" {
  description = "Whether the RDS instance is multi-AZ (for production set this to true for high availability)"
  type        = bool
  default     = false
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RDS subnet group"
  type        = list(string)
}

variable "deletion_protection" {
  description = "Whether to enable deletion protection for the RDS instance (for production turn this on)"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "The number of days to retain backups for the RDS instance (for production set this to a value greater than 0)"
  type        = number
  default     = 0
}

variable "storage_encrypted" {
  description = "Whether to enable storage encryption for the RDS instance (for production turn this on)"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Whether to skip the final snapshot when deleting the RDS instance (for production turn this false)"
  type        = bool
  default     = true
}
