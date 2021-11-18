terraform {
  required_version = "~> 1.0.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.6"
    }
  }

  backend "s3" {
    bucket = "razdev-terraform-tfstate"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}
