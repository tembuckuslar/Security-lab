resource "aws_s3_bucket" "public" {
  bucket = "group7-public-test-bucket"
  acl    = "public-read"
  tags   = { Project = "group7" }
}

resource "aws_security_group" "open_ssh" {
  name        = "group7-open-ssh"
  description = "TEST ONLY - deliberately open SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Project = "group7" }
}
