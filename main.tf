terraform {
  required_version = "~>0.15.5"

  required_providers {
    aws = ">=3.54.0"
  }

  backend "s3" {
    bucket = "desafio-clicksign-infra"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source             = "./modules/eks"
  public_subnets_id  = module.vpc.public_subnets_id
  private_subnets_id = module.vpc.private_subnets_id
  security_groups_id = module.vpc.security_groups_id
  vpc_id             = module.vpc.vpc_id
}