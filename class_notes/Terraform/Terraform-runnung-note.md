Main commands:
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  destroy       Destroy previously-created infrastructure
  
 
A simple project
Create a new folder /directory called: Project 1
Create a VPC named "FirstVPC"
CIDR range : 192.168.0.0/24

# Solution for project 
1) Create a new folder called: Project 1
2) Create a VPC named "FirstVPC"
3) CIDR range : 192.168.0.0/24
=================================================================

# Terraform Settings Block
terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 3.0"
        # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

# Resource Block

resource "aws_vpc" "project1vpc" {
    cidr_block = "192.168.0.0/24"
    tags = {
        Name = "FirstVPC"
    }
}
