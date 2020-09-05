//This is the vpc file for creating more VPC kindly add the resources below
resource "aws_vpc" "theo-vpc" {
  cidr_block = var.vpc_CIDR_block
  instance_tenancy = "default"
  tags = {
    Name="theo-vpc"
  }
}