resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = var.aws_s3_bucket

  tags = {
    Name        = "My bucket"
  }
}