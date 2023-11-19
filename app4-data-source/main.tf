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

resource "aws_instance" "server1" {
  ami = data.aws_ami.ami1.id
  key = data.aws_ami
  instance_type = "t3.small"
}

data "aws_key_pair" "keypair" {
  key_name           = "ec2-key"
  include_public_key = true
}

data "aws_ami" "ami1" {
  executable_users = ["self"]
  most_recent      = true
  name_regex       = "^myami-\\d{3}"
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["myami-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
