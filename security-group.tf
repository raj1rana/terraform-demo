//this file contains the security groups for the resources
// there are 3 security for alb-ec2, ec-2-client-ssh, RDS-ec-2


resource "aws_security_group" "theo-security-group-alb-ec-2" {
  name = "theo-security-group-alb-ec-2"
  description = "for communication between alb and ec-2"
  vpc_id = aws_vpc.theo-vpc.id
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = [aws_vpc.theo-vpc.cidr_block]
  }
  ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = [aws_vpc.theo-vpc.cidr_block]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name="theo-alb-ec-2"
    For="ALB<=>EC-2"
  }
}
resource "aws_security_group" "theo-security-group-ec-2-connection" {
  name = "theo-security-group-ec-2-connection"
  description = "for communication between via ssh and  "
  vpc_id = aws_vpc.theo-vpc.id

  ingress {
    from_port = 3306
    protocol = "tcp"
    to_port = 3306
    cidr_blocks = [aws_subnet.theo-rds-subnet.cidr_block]
    description = "MYSQL"
  }
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = var.ith_ips
  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name="theo-ec-2"
    For="EC-2<=>ssh"
  }

}

