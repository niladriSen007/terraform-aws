terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.56.0"
    }
  }
  backend "s3" {
    bucket = "terraform-s3-bucket-demo-niladri-e064d7b93ccd932b"
    key    = "aws-vpc"
    region = "ap-south-1"
  }
}

provider "aws" {
  # Configuration options
  region = var.aws_region
}

resource "aws_vpc" "my-vpc-for-terraform" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-vpc-terraform"
  }
}

resource "aws_subnet" "my-subnet-for-terraform--private" {
  vpc_id            = aws_vpc.my-vpc-for-terraform.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.aws_region_for_subnet
  tags = {
    Name = "my-subnet-for-terraform-private"
  }
}

resource "aws_subnet" "my-subnet-for-terraform--public" {
  vpc_id            = aws_vpc.my-vpc-for-terraform.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.aws_region_for_subnet
  tags = {
    Name = "my-subnet-for-terraform-public"
  }
}

resource "aws_internet_gateway" "my-igw-for-terraform" {
  vpc_id = aws_vpc.my-vpc-for-terraform.id
  tags = {
    Name = "my-igw-for-terraform"
  }
}

resource "aws_route_table" "my-route-table-for-terraform" {
  vpc_id = aws_vpc.my-vpc-for-terraform.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw-for-terraform.id
  }
  tags = {
    Name = "my-route-table-for-terraform"
  }
}

resource "aws_route_table_association" "my-route-table-association-for-terraform--public" {
  route_table_id = aws_route_table.my-route-table-for-terraform.id
  subnet_id      = aws_subnet.my-subnet-for-terraform--public.id
}

resource "aws_instance" "terraform_ec2_server" {
  ami           = "ami-0522ab6e1ddcc7055"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my-subnet-for-terraform--public.id

  tags = {
    Name = "terraform_ec2_server"
  }
  
}

