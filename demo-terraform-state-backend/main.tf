
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.66.0"
    }
  }
  backend "s3" {
    bucket = "terraform-s3-bucket-demo-niladri-e064d7b93ccd932b"
    key    = "tfstate-remote-backend"
    region = "ap-south-1"
  }
}

provider "aws" {
  # Configuration options
  region = var.aws_region
}

resource "aws_instance" "terraform_ec2_server" {
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform_ec2_server_for_remote_backend"
  }
}
