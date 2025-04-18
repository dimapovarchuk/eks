locals {
  name            = "monitoring"
  cluster_version = "1.27"
  region          = var.aws_region

  tags = {
    Environment = var.environment
    Terraform   = "true"
    Project     = "monitoring"
  }
}