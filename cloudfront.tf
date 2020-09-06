# for creating cloud front distribution

resource "aws_cloudfront_distribution" "theo-s3-distribution" {
  enabled = true
  default_cache_behavior {
    allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id
    viewer_protocol_policy = "allow-all"
    min_ttl = 0
    max_ttl = 86400
    default_ttl = 3600
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

  }
  ordered_cache_behavior {
    path_pattern     = "*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }
  ordered_cache_behavior {
    path_pattern     = "*"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }
  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations = ["*"]
    }
  }
  tags = {
    Name="theo-cloufront-distributon"
  }
  aliases = [var.cdn_domain_name]
  origin {
    domain_name = aws_s3_bucket.theo-staticfiles-s3-bucket.bucket_regional_domain_name
    origin_id = local.s3_origin_id
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    acm_certificate_arn = aws_acm_certificate.theo-cdn-ssl.arn

  }

}