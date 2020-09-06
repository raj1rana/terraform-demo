# for s3 bucket to keep static data
resource "aws_s3_bucket" "theo-staticfiles-s3-bucket" {
  bucket = "theo-staticfiles-s3-bucket"
  acl = "public-read"
  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["*"]
    allowed_origins = ["*"]
    expose_headers = ["ETag"]
    max_age_seconds = 3000
  }

  policy = file(var.s3_policy_file)
}