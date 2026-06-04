terraform {
  required_version = ">= 1.15.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.47"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 3.1"
    }
  }
  backend "s3" {}
}
