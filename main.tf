terraform {
  required_version = "~> 1.5.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.24.1"
    }
  }

  backend "s3" {
    bucket = "terraform-remote-state-2023-06-19"
    key    = "terraform.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "random_id" "bucket_id" {
  count       = 100
  byte_length = 8
}

resource "aws_s3_bucket" "bucket" {
  count  = length(random_id.bucket_id.*.hex)
  bucket = "bucket-${random_id.bucket_id[count.index].hex}"
  acl    = "private"

  tags = {
    Name        = "bucket-${random_id.bucket_id[count.index].hex}"
    Environment = "Test"
  }
}
