terraform {
  backend "s3" {
    bucket = "vpc-terraform-backendbucket"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
  }
}


provider "aws" {
  region = "us-east-1"
}

