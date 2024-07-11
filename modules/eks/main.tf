provider "aws" {
  region = var.region
}

module "vpc" {
  source = "../vpc"
  region = var.region
  cidr_block = var.vpc_cidr_block
  public_subnet_cidrs = var.public_subnet_cidrs
  availability_zones  = var.availability_zones
}

resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = module.vpc.public_subnet_ids
  }

  depends_on = [module.vpc]
}

output "cluster_id" {
  value = aws_eks_cluster.this.id
}
