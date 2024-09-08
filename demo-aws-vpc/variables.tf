variable "aws_region" {
  description = "The AWS region to launch the EC2 instance."
  type        = string
  default     = "ap-south-1"
}

variable "aws_region_for_subnet" {
  description = "The AWS region to launch the VPC and Subnet."
  type        = string
  default     = "ap-south-1a"
}
