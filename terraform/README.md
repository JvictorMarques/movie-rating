# terraform

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.15.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.45.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ecr"></a> [ecr](#module\_ecr) | ./modules/ecr | n/a |
| <a name="module_eks"></a> [eks](#module\_eks) | ./modules/eks | n/a |
| <a name="module_rds"></a> [rds](#module\_rds) | ./modules/rds | n/a |
| <a name="module_ssm"></a> [ssm](#module\_ssm) | ./modules/ssm | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to deploy resources | `string` | `"us-east-1"` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name of the database to create when the DB instance is created | `string` | `"movie-rating"` | no |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | The username for the database | `string` | `"movie-rating"` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default tags for AWS resources | `map(string)` | <pre>{<br/>  "Environment": "Test",<br/>  "Project": "Default Tag"<br/>}</pre> | no |
| <a name="input_eks_version"></a> [eks\_version](#input\_eks\_version) | Kubernetes version to use for the EKS cluster. | `string` | `"1.35"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The version of the database engine to use | `string` | `"17.10"` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | The instance class for the RDS instance | `string` | `"db.t3.micro"` | no |
| <a name="input_instance_storage"></a> [instance\_storage](#input\_instance\_storage) | Storage size for the RDS instance in GB | `number` | `5` | no |
| <a name="input_multi_az"></a> [multi\_az](#input\_multi\_az) | Whether to create a Multi-AZ RDS instance | `bool` | `false` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the project | `string` | `"movie-rating"` | no |
| <a name="input_subnets_azs"></a> [subnets\_azs](#input\_subnets\_azs) | List of availability zones to use for subnets | `set(string)` | <pre>[<br/>  "us-east-1a",<br/>  "us-east-1b",<br/>  "us-east-1c"<br/>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
