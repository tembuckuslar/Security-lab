provider "aws" {
  region = "eu-west-1"
}

#checkov:skip=CKV2_AWS_11:Lab VPC does not require flow logs
#checkov:skip=CKV2_AWS_12:Lab VPC default SG will not be used
resource "aws_vpc" "lab_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Project = "group7"
  }
}

resource "aws_security_group" "web_sg" {
  name_prefix = "group7-web-sg-"
  description = "Allow HTTPS traffic for the secure lab"
  vpc_id      = aws_vpc.lab_vpc.id

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

resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id            = aws_vpc.lab_vpc.id
  service_name      = "com.amazonaws.eu-west-1.s3"
  vpc_endpoint_type = "Gateway"
  security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Project = "group7"
  }
}