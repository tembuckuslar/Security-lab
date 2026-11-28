provider "aws" {
  region = "eu-west-1"
}

#checkov:skip=CKV_AWS_338:Lab logs do not need 1 year retention
#checkov:skip=CKV_AWS_158:Lab logs do not require KMS encryption
resource "aws_cloudwatch_log_group" "lab_logs" {
  name              = "/group7/lab-logs-v2"
  retention_in_days = 7

  tags = {
    Project = "group7"
  }
}
resource "aws_s3_bucket" "m6_untagged" {
  bucket = "group7-m6-untagged-test-481516"
}
