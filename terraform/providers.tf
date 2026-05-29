locals {
  tags = merge(var.default_tags, { Project = var.project_name })
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = local.tags
  }
}

data "aws_eks_cluster" "this" {
  name = module.eks_cluster.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = module.eks_cluster.cluster_name
}

provider "helm" {
  kubernetes = {
    host                   = data.aws_eks_cluster.this.endpoint
    cluster_ca_certificate = base64decode(module.eks_cluster.cluster_certificate_authority_data)
    token                  = data.aws_eks_cluster_auth.this.token
  }
}
