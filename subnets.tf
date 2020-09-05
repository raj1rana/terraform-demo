//for creating subnets kindly edit this file


resource "aws_subnet" "theo-public-subnet-1" {
  cidr_block = var.public_subnet_1
  vpc_id = aws_vpc.theo-vpc.id
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name="theo-public-subnet-1"
    For="Production"
  }
}
resource "aws_subnet" "theo-public-subnet-2" {
  cidr_block = var.public_subnet_2
  vpc_id = aws_vpc.theo-vpc.id
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name="theo-public-subnet-2"
    For="Production"
  }
}
resource "aws_subnet" "theo-public-subnet-3" {
  cidr_block = var.public_subnet_3
  vpc_id = aws_vpc.theo-vpc.id
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name="theo-public-subnet-3"
    For="Production"
  }
}
resource "aws_subnet" "theo-public-subnet-4" {
  cidr_block = var.public_subnet_4
  vpc_id = aws_vpc.theo-vpc.id
  availability_zone = "us-east-1d"
  map_public_ip_on_launch = true
  tags = {
    Name="theo-public-subnet-4"
    For="Production"
  }
}
resource "aws_subnet" "theo-public-subnet-5" {
  cidr_block = var.public_subnet_5
  vpc_id = aws_vpc.theo-vpc.id
  availability_zone = "us-east-1f"
  map_public_ip_on_launch = true
  tags = {
    Name="theo-public-subnet-5"
    For="Production"
  }
}
resource "aws_subnet" "theo-rds-subnet" {
  cidr_block = var.private_subnet
  vpc_id = aws_vpc.theo-vpc.id
  tags = {
    Name="theo-private-subnet"
    For="Production"
  }
}