output "aws_instance_public_ip" {
  value = aws_instance.terraform_ec2_server.public_ip
}