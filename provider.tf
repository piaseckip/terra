terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.33.0"
    }
  }

  backend "s3" {
    bucket = "piotrek-right"
    key    = "Piotrek-right-state"
    region = "eu-west-2"
  }
}

provider "aws" {
  region = var.region
}