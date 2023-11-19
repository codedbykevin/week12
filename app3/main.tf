terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "week7" {
  source = "github.com/codedbykevin/terraform-week7"
}

locals {
  env = "dev"
}

output "my-var" {
  value = local.env
}