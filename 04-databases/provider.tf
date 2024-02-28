terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0" # AWS provider version, not terraform version
    }
  }
  backend "s3" {
    bucket = "techwithgopi-state-dev"
    key = "databases"
    region="us-east-1"
    dynamodb_table = "techwithgopi-locking-dev"
  }
  # if you give plan we get error stating that reconfigure using " terraform init -reconfigure "
}

provider "aws" {
  region = "us-east-1"
}