# for creating IAM user and policy for s3
resource "aws_iam_access_key" "s3-user" {
  user    = aws_iam_user.theo-s3user.name
  pgp_key = "keybase:theo-s3-key"
}

resource "aws_iam_user" "theo-s3user" {
  name = "theo-s3-user"
  path = "/system/"
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "AmazonS3FullAccess2"
  user = aws_iam_user.theo-s3user.name

  policy = file(var.s3_user_policy)
  provisioner "local-exec" {
    command = "echo  ${aws_iam_access_key.s3-user.encrypted_secret}>> s2user.txt"
  }
}

output "secret" {
  value = aws_iam_access_key.s3-user.encrypted_secret
}