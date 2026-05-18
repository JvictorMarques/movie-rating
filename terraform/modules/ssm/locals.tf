locals {
  database_secrets_keys = {
    name     = var.database_secrets.name
    username = var.database_secrets.username
    password = var.database_secrets.password
    address  = var.database_secrets.address
  }
} # This local variable is used to create a map of the keys for the database secrets.
# It is used in the aws_ssm_parameter resource to create a parameter for each key in the map
# Because if we use var.database_secrets directly in the for_each, it will raise a error because of sensitive values.
# So we need to create a local variable with only the keys of the map and use it in the for_each.
