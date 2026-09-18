variable "aws_region" {
  description = "The AWS region to deploy the instance"
  type        = string
  default     = "us-west-2"
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = map(string)
  default     = {
	"example" = "t2.micro"
	"production" = "t2.medium"
	"development" = "t2.small"
  }
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Example Ubuntu AMI ID
}

variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
  default     = "my-key-pair" # Replace with your actual key pair name
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
