provider "aws" {
  region = "eu-west-1"
}

#checkov:skip=CKV2_AWS_5:This is a standalone lab Security Group, not attached to an EC2 instance
resource "aws_security_group" "web_sg" {
  name        = "group7-web-sg"
  description = "Allow HTTPS traffic for the secure lab"

  ingress {
    description = "Allow HTTPS from anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound HTTPS only"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = "group7"
  }
}