provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

resource "random_string" "suffix" {
  length = 8
  special = false
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.available.names
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = true
  single_nat_gateway = true
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = var.tags
  public_subnet_tags = var.public_subnet_tags
  private_subnet_tags = var.private_subnet_tags
}