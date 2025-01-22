module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version
  subnet_ids      = var.private_subnets

  enable_irsa = true
  tags = var.tags
  vpc_id = var.vpc_id

  eks_managed_node_group_defaults = {
    ami_type               = var.ami_type
    instance_types         = var.instance_types
    vpc_security_group_ids = var.vpc_security_group_ids
  }

  eks_managed_node_groups = {
    node_group = {
      min_size     = var.eks_min_size
      max_size     = var.eks_max_size
      desired_size = var.eks_desire_size
    }
  }
}