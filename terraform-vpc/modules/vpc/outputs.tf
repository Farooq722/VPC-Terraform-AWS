output "vpc" {
  value = aws_vpc.my-vpc.id
}

output "subnets" {
  value = aws_subnet.my-subnets.*.id
}
