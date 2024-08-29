variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
}

variable "instance_keypair" {
  description = "AWS EC2 Key pair that need to be associated with ec2"
  type = string
  default = "terraform-key"
}