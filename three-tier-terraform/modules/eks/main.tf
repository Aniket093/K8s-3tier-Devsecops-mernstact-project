module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.31"

  subnet_ids = var.private_subnets
  vpc_id     = var.vpc_id

  enable_irsa = true

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  eks_managed_node_groups = {
    dev = {
      desired_size = 2
      min_size     = 1
      max_size     = 3

      instance_types = ["t3.small"]

      capacity_type = "ON_DEMAND"
    }
  }

  tags = {
    Environment = "dev"
  }
}