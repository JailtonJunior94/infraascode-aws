terraform {
  required_version = "1.0.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.58.0"
    }
  }

  backend "s3" {
    bucket = "storageterraformjj"
    key    = "finance-infra/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "remote_state" {
  bucket = "storageterraformjj"

  versioning {
    enabled = true
  }

  tags = {
    "Owner" = "Jailton Junior"
  }
}
