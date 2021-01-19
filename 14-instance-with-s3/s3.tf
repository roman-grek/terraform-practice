resource "aws_s3_bucket" "bucket" {
  bucket = "mybucket-roman-grek"
  acl    = "private"

  tags = {
    Name = "mybucket-roman-grek"
  }
}