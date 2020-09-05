resource "aws_lb" "theo-alb" {
  name = "theo-alb"
  internal = false
  load_balancer_type = "application"


}