module "eks_vpc" {
  source = "./modules/vpc"
  region = "ap-south-1"
  vpc_name = "demo-vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  vpc_public_subnets = ["10.0.4.0/24", "10.0.5.0/24"]
  private_subnet_tags = local.vpc_private_subnet_tags
  public_subnet_tags = local.vpc_public_subnet_tags
  tags = local.vpc_tags
}

module "eks_sg" {
  source = "./modules/sg"
  vpc_id = module.eks_vpc.vpc_id
  cidr_blocks = [ "10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16" ]
}

module "eks" {
  source = "./modules/eks"
  cluster_name = local.cluster_name
  kubernetes_version = "1.31"
  vpc_id = module.eks_vpc.vpc_id
  vpc_security_group_ids = [ module.eks_sg.security_group_id ]
  private_subnets = module.eks_vpc.vpc_private_subnets
  ami_type = "AL2_x86_64"
  instance_types = ["t3.medium"]
  eks_min_size = 1
  eks_max_size = 1
  eks_desire_size = 1
  tags = local.eks_tags
}