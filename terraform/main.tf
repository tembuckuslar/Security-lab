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
resource "aws_security_group" "m6_test_ssh" {
  name        = "m6-test-ssh"
  description = "Case B test: SSH open to the world"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = "group7-devsecops"
    Owner   = "team"
  }
}