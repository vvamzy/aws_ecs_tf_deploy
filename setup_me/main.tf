resource "aws_s3_bucket" "terraform_state" {
  bucket = "vamz-s3-state-files"
  force_destroy = true

  lifecycle {
    prevent_destroy = false
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "Terraform State Storage"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform Lock Table"
  }
}
terraform {
#   backend "s3" {
#     bucket         = "vamz-s3-state-files"
#     key            = "ecs-project/terraform.tfstate"
#     region         = "ap-south-1"
#     dynamodb_table = "terraform-locks"
#     encrypt        = true
#   }
}
provider "aws" {

}