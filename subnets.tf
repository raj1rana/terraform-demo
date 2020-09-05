//for creating subnets kindly edit this file


resource "aws_subnet" "theo-public-subnet" {
  cidr_block = var.public_subnet
  vpc_id = aws_vpc.theo-vpc.id
  tags = {
    Name="theo-public-subnet"
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