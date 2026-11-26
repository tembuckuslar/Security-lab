provider "aws" {
  region = "eu-west-1"
}

resource "aws_cloudwatch_log_group" "lab_logs" {
  name              = "/group7/lab-logs"
  retention_in_days = 7

  tags = {
    Project = "group7"
  }
}