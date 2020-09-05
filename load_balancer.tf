resource "aws_lb" "theo-alb" {
  name = "theo-alb"
  internal = false
  load_balancer_type = "application"
  subnets = [aws_subnet.theo-public-subnet-1.id, aws_subnet.theo-public-subnet-2.id]
  security_groups = [aws_security_group.theo-security-group-alb-ec-2.id]
  enable_deletion_protection=true

  tags = {
    Name="theo-aws-lb"
  }


}