provider "aws" {
  region = "eu-west-1"
}

#checkov:skip=CKV_AWS_145:Encryption enabled via separate resource below
#checkov:skip=CKV_AWS_21:Versioning not required for lab
#checkov:skip=CKV_AWS_18:Access logging not required for lab
#checkov:skip=CKV2_AWS_61:Lifecycle configuration not required for lab
#checkov:skip=CKV_AWS_144:Cross-region replication not required for lab
#checkov:skip=CKV2_AWS_62:Event notifications not required for lab
resource "aws_s3_bucket" "lab_bucket" {
  bucket = "group7-final-lab-bucket-12345"
  
  tags = {
    Project = "group7"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "lab_bucket_crypto" {
  bucket = aws_s3_bucket.lab_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "lab_bucket_pab" {
  bucket = aws_s3_bucket.lab_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}