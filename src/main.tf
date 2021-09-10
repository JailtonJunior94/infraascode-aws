terraform {
  backend "s3" {
    bucket = "storageterraformjj"
    key    = "finance-infra"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}
