variable "project_name" {
  description = "The name of the project, used for naming resources and tags."
  type        = string
  default     = "movie-rating"
}

variable "database_secrets" {
  description = "Secrets value related to the project."
  type = object({
    name = object({
      value       = string
      description = optional(string, "The name of the database.")
    })
    username = object({
      value       = string
      description = optional(string, "The username for the database.")
    })
    password = object({
      value       = string
      description = optional(string, "The password for the database.")
    })
    address = object({
      value       = string
      description = optional(string, "The address of the database.")
    })
    port = object({
      value       = optional(string)
      description = optional(string, "The port of the database.")
    })
  })
  sensitive = true
}
