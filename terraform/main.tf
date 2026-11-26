provider "aws" {
  region = "eu-west-1"
}

#checkov:skip=CKV_AWS_145:Lab bucket does not require KMS encryption (AES256 is sufficient)
#checkov:skip=CKV_AWS_21:Lab bucket does not require versioning
#checkov:skip=CKV_AWS_18:Lab bucket does not require access logging
#checkov:skip=CKV2_AWS_61:Lab bucket does not require lifecycle configuration
#checkov:skip=CKV_AWS_144:Lab bucket does not require cross-region replication
#checkov:skip=CKV2_AWS_62:Lab bucket does not require event notifications
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

resource "aws_s3_bucket_public_access_block" "secure_bucket_pab" {
  bucket = aws_s3_bucket.secure_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
# Trigger pipeline
