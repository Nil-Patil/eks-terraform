locals {
  cluster_name = "demo-eks"
  vpc_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }

  vpc_public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  vpc_private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }

  eks_tags = {
    cluster = "demo"
  }
}