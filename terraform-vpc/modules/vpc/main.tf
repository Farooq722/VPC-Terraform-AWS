#create VPC
resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc-cidr
  instance_tenancy = "default"

  tags = {
    "Name" = "my-vpc"

  }
}
#create 2 Subnets
resource "aws_subnet" "my-subnets" {
  count = length(var.subnet-cidr)
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = var.subnet-cidr[count.index]
  availability_zone = data.aws_availability_zones.availability-zones.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet-names[count.index]
  }
}
#create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = var.gateway-name
  }
}
#create Route Table
resource "aws_route_table" "my-route-table" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "my-rt"
  }
}
#create Route Table Association
resource "aws_route_table_association" "my-rt-association" {
  count = length(var.subnet-cidr)
  subnet_id      = aws_subnet.my-subnets[count.index].id
  route_table_id = aws_route_table.my-route-table.id
}