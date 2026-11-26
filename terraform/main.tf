provider "aws" {
  region = "eu-west-1"
}

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
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Project = "group7"
  }
}