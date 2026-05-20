module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  subnets_azs  = var.subnets_azs
}

module "ecr" {
  source       = "./modules/ecr"
  project_name = var.project_name
}

module "rds" {
  source       = "./modules/rds"
  project_name = var.project_name
  subnet_ids   = module.vpc.private_subnet_ids
  vpc_id       = module.vpc.id

  engine_version = var.engine_version

  db_name     = var.db_name
  db_username = var.db_username

  instance_class   = var.instance_class
  instance_storage = var.instance_storage

  multi_az = var.multi_az

  eks_cluster_security_group_id = module.eks.cluster_security_group_id
}

module "ssm" {
  source       = "./modules/ssm"
  project_name = var.project_name
  database_secrets = {
    name = {
      value = module.rds.name
    }
    username = {
      value = module.rds.username
    }
    password = {
      value = module.rds.password
    }
    address = {
      value = module.rds.endpoint
    }
    port = {
      value = module.rds.port
    }
  }
}

module "eks" {
  source             = "./modules/eks"
  project_name       = var.project_name
  kubernetes_version = var.eks_version
  private_subnet_ids = module.vpc.private_subnet_ids
}

module "eks_blueprints_addons" {
  source  = "aws-ia/eks-blueprints-addons/aws"
  version = "~> 1.22.0"

  cluster_name      = module.eks.cluster_name
  cluster_endpoint  = module.eks.cluster_endpoint
  cluster_version   = module.eks.cluster_version
  oidc_provider_arn = module.eks.oidc_provider_arn

  observability_tag = null

  enable_aws_load_balancer_controller = true
  aws_load_balancer_controller = {
    set = [
      {
        name  = "vpcId"
        value = module.vpc.id
      }
    ]
  }
  enable_cluster_autoscaler = true
  enable_metrics_server     = true
  enable_external_secrets   = true

}
