module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
  cluster_name = var.eks_cluster_name
  subnets_azs  = var.subnets_azs
}

module "ecr" {
  count               = length(var.ecr_repository_name)
  source              = "./modules/ecr"
  ecr_repository_name = var.ecr_repository_name[count.index]
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

  eks_cluster_security_group_id = module.eks_cluster.cluster_security_group_id
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

module "eks_cluster" {
  source             = "./modules/eks"
  cluster_name       = var.eks_cluster_name
  kubernetes_version = var.eks_version
  private_subnet_ids = module.vpc.private_subnet_ids
}

module "eks_pod_identities" {
  source       = "./modules/eks-pod-identity-roles"
  project_name = var.project_name
  cluster_name = module.eks_cluster.cluster_name
}

module "addons" {
  source                                            = "./modules/eks-addons"
  cluster_name                                      = module.eks_cluster.cluster_name
  region                                            = var.aws_region
  vpc_id                                            = module.vpc.id
  aws_load_balancer_controller_service_account_name = module.eks_pod_identities.aws_load_balancer_controller_service_account_name
  cluster_autoscaler_service_account_name           = module.eks_pod_identities.cluster_autoscaler_service_account_name
  external_secrets_service_account_name             = module.eks_pod_identities.external_secrets_service_account_name

  depends_on = [
    module.eks_cluster,
    module.eks_pod_identities,
  ]
}
#
