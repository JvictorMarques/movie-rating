# ssm

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.15.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.45 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.45.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database_secrets"></a> [database\_secrets](#input\_database\_secrets) | Secrets value related to the project. | <pre>object({<br/>    name = object({<br/>      value       = string<br/>      description = optional(string, "The name of the database.")<br/>    })<br/>    username = object({<br/>      value       = string<br/>      description = optional(string, "The username for the database.")<br/>    })<br/>    password = object({<br/>      value       = string<br/>      description = optional(string, "The password for the database.")<br/>    })<br/>    address = object({<br/>      value       = string<br/>      description = optional(string, "The address of the database.")<br/>    })<br/>  })</pre> | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The name of the project, used for naming resources and tags. | `string` | `"movie-rating"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
