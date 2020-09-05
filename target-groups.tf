//for target groups
resource "aws_lb_target_group" "theo-target-group-1" {
  name     = "theo-target-group-1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.theo-vpc.id
}
resource "aws_lb_target_group" "theo-target-group-2" {
  name     = "theo-target-group-2"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = aws_vpc.theo-vpc.id
}