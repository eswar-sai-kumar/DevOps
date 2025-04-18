terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  # In terraform there is remote state. It does not allow duplicate resources to be created
  # In remote state .lock , .tfstate file will be present
  # .lock file == When one person creating infra. It should be locked until it gets completed
  # .tfstate == this file tracks actual infra. It checks infra you are creating already present or not in .tfstate file. Nothing but refreshing state.
  # for storing .tf state file : S3 bucked created
  # for locking : dynamoDB created
  backend "s3" {
    bucket = "daws78s-remote-state"     # name of the bucket
    key    = "remote-state-demo"
    region = "us-east-1"
    dynamodb_table = "daws78s-locking"   # name of the table
  }
}

#provide authentication here
provider "aws" {
  region = "us-east-1"
}