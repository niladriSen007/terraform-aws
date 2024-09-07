
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.66.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.aws_region
}

resource "random_id" "random" {
  byte_length = 8
}

resource "aws_s3_bucket" "terraform_s3_bucket" {
  bucket = "${var.bucket_name}-${random_id.random.hex}"
}

resource "aws_s3_object" "terraform_s3_bucket_object" {
  bucket = aws_s3_bucket.terraform_s3_bucket.bucket
  key    = "mydemo.txt"
  source = "./mydemo.txt"
}
