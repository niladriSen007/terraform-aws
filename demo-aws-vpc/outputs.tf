output "vpc_id" {
  value = aws_vpc.my-vpc-for-terraform.id
}
output "private_subnet_id" {
  value = aws_subnet.my-subnet-for-terraform--private.id
}
output "public_subnet_id" {
  value = aws_subnet.my-subnet-for-terraform--public.id
}
output "internet_gateway_id" {
  value = aws_internet_gateway.my-igw-for-terraform.id
}
output "route_table_id" {
  value = aws_route_table.my-route-table-for-terraform.id
}
output "route_table_association_id" {
  value = aws_route_table_association.my-route-table-association-for-terraform--public.id
}

output "terraform_ec2_server_public_ip" {
  value = aws_instance.terraform_ec2_server.public_ip
}
