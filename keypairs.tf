// this file is for aws key pairs
resource "aws_key_pair" "theo-keys" {
  key_name = "theo-keys"
  public_key = file(var.public_key)
}