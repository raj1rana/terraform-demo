//instance file, 2 instances for load balancing
resource "aws_instance" "theo-ec2-01" {

  ami = var.ami
  instance_type = var.ec-2_type
  key_name = aws_key_pair.theo-keys.key_name
  associate_public_ip_address = true
  security_groups = [

    aws_security_group.theo-security-group-alb-ec-2.name,

    aws_security_group.theo-security-group-ec-2-connection.name

  ]
  tags = {
    Name="theo-ec2-01"
  }


  provisioner "local-exec" {
     command="echo ${aws_instance.theo-ec2-01.public_ip} >> hosts"
  }
}
resource "aws_instance" "theo-ec2-02" {

  ami = var.ami
  instance_type = var.ec-2_type
  key_name = aws_key_pair.theo-keys.key_name
  associate_public_ip_address = true
  security_groups = [
    aws_security_group.theo-security-group-alb-ec-2.name,

    aws_security_group.theo-security-group-ec-2-connection.name
  ]
  tags = {
    Name="theo-ec2-02"
  }


  provisioner "local-exec" {
     command="echo ${aws_instance.theo-ec2-02.public_ip} >> hosts"
  }
}
