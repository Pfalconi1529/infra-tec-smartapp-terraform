terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.0"
    }
  }
}

provider "aws" {
  region = local.region
  profile = local.env
  # assume_role {
  #   role_arn = "arn:aws:iam::987078318796:role/infra-tecsmartapp-manager"
  # }
}