terraform {
  required_version = "~> 1.5.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.24.1"
    }
    google = {
      source  = "hashicorp/google"
      version = "3.49.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.40.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.0.3"
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

provider "google" {
  project = "my-project"
  region  = "us-central1"
}

provider "azurerm" {
  features {}
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "random_id" "sample" {
  byte_length = 8
}
