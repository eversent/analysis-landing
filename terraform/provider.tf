terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.62.0"
    }
  }

  backend "s3" {
    bucket         = "auto-minder-terraform-frontend"
    key            = "youpost-analysis/webapp/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "auto-minder-terraform-frontend-lock"
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_caller_identity" "current" {}
