terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.1"
    }
  }

  # backend "s3" {
  #   bucket = "emmas-terraform-remote-backend-s3"
  #   dynamodb_table = "state-lock"
  #   key    = "dev/terraform.tfstate"
  #   region = "us-east-1"
  #   encrypt = true
  #  }
}

provider "aws" {
    region = var.region
   // access_key = var.access_key
   // secret_key = var.secret_key
  //  If you have entered your credentials in AWS CLI before, you do not need to use these arguments.
}