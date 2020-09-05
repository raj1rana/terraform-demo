//attaching instances to the target groups
resource "aws_alb_target_group_attachment" "theo-target-group-attachment-1-1" {
  target_group_arn = aws_lb_target_group.theo-target-group-1.arn
  target_id = aws_instance.theo-ec2-01.id
}
resource "aws_alb_target_group_attachment" "theo-target-group-attachment-1-2" {
  target_group_arn = aws_lb_target_group.theo-target-group-1.arn
  target_id =  aws_instance.theo-ec2-02.id
}
resource "aws_alb_target_group_attachment" "theo-target-group-attachment-2-1" {
  target_group_arn = aws_lb_target_group.theo-target-group-2.arn
  target_id =  aws_instance.theo-ec2-02.id
}

resource "aws_alb_target_group_attachment" "theo-target-group-attachment-2-2" {
  target_group_arn = aws_lb_target_group.theo-target-group-2.arn
  target_id =  aws_instance.theo-ec2-02.id
}


