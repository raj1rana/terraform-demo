// this file is for internet gateway
resource "aws_internet_gateway" "theo-gw" {
  vpc_id = aws_vpc.theo-vpc.id

  tags = {
    Name = "main"
  }
}