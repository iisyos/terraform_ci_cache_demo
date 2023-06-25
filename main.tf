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