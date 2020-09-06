// this file is for route table
resource "aws_route_table" "theo-public" {
  vpc_id = aws_vpc.theo-vpc.id
  route {
    cidr_block = var.route_table_CIDR_block
    gateway_id = aws_internet_gateway.theo-gw.id
  }
  tags = {
    Name="theo-public-route-table"
  }
}

resource "aws_route_table_association" "theo-association" {
  count = length(var.public_subnet_1)
  subnet_id = element(aws_subnet.theo-public-subnet-1.*.id, count.index )

  route_table_id = aws_route_table.theo-public.id
}
resource "aws_route_table_association" "theo-association-1" {
  count = length(var.public_subnet_2)
  subnet_id = element(aws_subnet.theo-public-subnet-2.*.id, count.index )

  route_table_id = aws_route_table.theo-public.id
}