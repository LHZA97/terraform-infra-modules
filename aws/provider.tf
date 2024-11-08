terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>5.0.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      "terraform:created_using" = "Terraform"
      "terraform:repository"    = var.repository
      "cloud_support_owner"     = var.created_by
      "environment"             = var.env
      # "Name"                    = var.project
      "application_owner"       = var.app_owner
    }
  }
}