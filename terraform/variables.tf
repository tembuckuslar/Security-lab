
variable "aws_region" {
  description = "AWS region for the project"
  type        = string
  default     = "eu-west-1"
}

variable "project_name" {
  description = "Name of the DevSecOps project"
  type        = string
  default     = "devsecops-cloud-lab"
}

variable "owner" {
  description = "Project resource owner"
  type        = string
  default     = "Member-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}
