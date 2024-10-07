# VPC Input Variables

# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-2"
}

# VPC Name
variable "vpc_name" {
  description = "VPC Name"
  type = string
  default = "myvpc"
}

# VPC CIDR Block
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type = string
  default = "10.0.0.0/16"
}

# Environment Variable
variable "environment" {
  description = "Env var used as a prefix"
  type = string
  default = "dev"
}

# Business Devision
variable "business_devision" {
  description = "Business devision in a large organization"
  type = string
  default = "SAP"
}