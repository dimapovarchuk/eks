terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "monitoring/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}