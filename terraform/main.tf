provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "secure_bucket" {
  bucket = "group7-secure-lab-bucket-12345"

  tags = {
    Project = "group7"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "secure_bucket_crypto" {
  bucket = aws_s3_bucket.secure_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}