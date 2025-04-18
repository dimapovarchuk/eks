module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.27"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    monitoring = {
      min_size     = 2
      max_size     = 4
      desired_size = 2

      instance_types = ["t3.large"]
      capacity_type  = "ON_DEMAND"

      labels = {
        role = "monitoring"
      }

      taints = {
        dedicated = {
          key    = "dedicated"
          value  = "monitoring"
          effect = "NO_SCHEDULE"
        }
      }
    }
  }

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}