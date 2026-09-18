variable "aws_region" {
  default = "us-west-2"	
}

variable "vpc_name" {
  default = "myvpc"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "vpc_public_subnets" {
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "vpc_private_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_availability_zones" {
  default = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

variable "vpc_database_subnets" {
  default = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
}