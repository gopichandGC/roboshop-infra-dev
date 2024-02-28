terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0" # AWS provider version, not terraform version
    }
  }
  backend "s3" {
    bucket = "techwithgopi-remote-state"
    key = "default"
    region="us-east-1"
    dynamodb_table = "techwithgopi-locking"
  }
  # if you give plan we get error stating that reconfigure using " terraform init -reconfigure "
}

provider "aws" {
  region = "us-east-1"
}