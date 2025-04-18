terraform {
  backend "s3" {
    bucket         = "dima001-terraform-state-bucket"
    key            = "monitoring/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}