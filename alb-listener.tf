# this file is for
resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.theo-alb.arn
  port = 443
  protocol = "TLS"
  certificate_arn = aws_acm_certificate.theo-ssl.arn
  default_action {
    target_group_arn = aws_lb_target_group.theo-target-group-2.arn
    type = "forward"
  }
}

resource "aws_lb_listener_certificate" "alb-cert-listener" {
  certificate_arn = aws_acm_certificate.theo-ssl.arn
  listener_arn = aws_lb_listener.alb-listener.arn
}