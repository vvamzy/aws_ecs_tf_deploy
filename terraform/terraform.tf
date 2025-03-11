terraform {
  backend "s3" {
    bucket         = "vamz-s3-state-files"
    key            = "ecs-project/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.89.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}