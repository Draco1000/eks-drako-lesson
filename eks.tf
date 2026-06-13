module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.37"

  # Dynamic cluster naming
  cluster_name    = "drako-eks-cluster-${var.environment}"
  cluster_version = "1.33"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    workers = {
      # Injecting our variables here!
      min_size     = var.min_node_count
      max_size     = 3
      desired_size = 2

      instance_types = [var.worker_instance_type]
      capacity_type  = "SPOT"
    }
  }
}
