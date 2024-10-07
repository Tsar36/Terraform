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

# VPC Public Subnets
variable "vpc_public_subnets" {
  description = "List of public subnets"
  type = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

# VPC Private Subnets
variable "vpc_private_subnets" {
  description = "List of private subnets"
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

# AWS AZs
variable "vpc_availability_zones" {
  description = "VPC Availability Zones"
  type = list(string)
  default = ["us-east-2a", "us-east-2b"]
}

# VPC Database Subnets
variable "vpc_database_subnets" {
  description = "VPC Database Subnets"
  type = list(string)
  default = [ "10.0.151.0/24", "10.0.152.0/24" ]
}

# VPC Create DB Subnet Group (True/False)
variable "vpc_create_database_subnet_group" {
  description = "VPC create Database Subnet Group"
  type = bool
  default = true
}

# VPC Create DB Subnet Route Table (T/F)
variable "vpc_create_database_subnet_route_table" {
  description = "VPC Create Database Subnet Route Table"
  type = bool
  default = true
}

# VPC Enable NAT Gateway (T/F)
variable "vpc_enable_nat_gateway" {
  description = "Enable NAT-Gateways for Private Subnets Outbound"
  type = bool
  default = false
}

# VPC Single NAT Gateway (T/F)
variable "vpc_single_nat_gateway" {
  description = "Enable only single NAT Gateway in one Availability Zone"
  type = bool
  default = true
}