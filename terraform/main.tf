terraform {
  required_version = ">= 1.15.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.45.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = merge(var.default_tags, { Project = var.project_name })
  }
}

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

  engine_version = var.engine_version

  db_name     = var.db_name
  db_username = var.db_username

  instance_class   = var.instance_class
  instance_storage = var.instance_storage

  multi_az = var.multi_az
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
  }
}

module "eks" {
  source             = "./modules/eks"
  project_name       = var.project_name
  kubernetes_version = var.eks_version
  private_subnet_ids = module.vpc.private_subnet_ids
}
