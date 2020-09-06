# this file is for create ACM certificate for ALB and website
resource "aws_acm_certificate" "theo-ssl" {
  domain_name = var.domain_name
  validation_method = "DNS"

  provisioner "local-exec" {
    command="echo  ${aws_acm_certificate.theo-ssl.domain_validation_options.*}  >> certificateDNSValidation.txt"
  }
}


output "acm_details" {
  value = aws_acm_certificate.theo-ssl.domain_validation_options.*
}

resource "aws_acm_certificate_validation" "validation-cert" {
  certificate_arn = aws_acm_certificate.theo-ssl.arn
}