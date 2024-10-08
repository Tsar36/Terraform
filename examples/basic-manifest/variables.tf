variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "us-east-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_keypair" {
  description = "AWS EC2 Key pair that need to be associated with ec2"
  type        = string
  default     = "terraform-key"
}

# AWS Instance type - list
variable "instance_type_list" {
  description = "EC2 Instance Type"
  type        = list(string)
  default     = ["t2.micro", "t2.small", "t3.micro"]
}

# AWS EC2 Instance Type - Map
variable "instance_type_map" {
  description = "EC2 Instance Type"
  type        = map(string)
  default = {
    "dev"  = "t2.micro"
    "qa"   = "t2.small"
    "prod" = "t3.micro"
  }
}
