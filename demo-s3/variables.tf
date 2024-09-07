variable "aws_region" {
  description = "The AWS region to launch the EC2 instance."
  type        = string
  default     = "ap-south-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
  default     = "terraform-s3-bucket-demo-niladri"
}