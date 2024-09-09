# Terraform module which creates VPC Resources on AWS
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  # VPC Basic details:
  name            = "vpc-dev"
  cidr            = "10.0.0.0/16"
  azs             = ["us-east-2a", "us-east-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]

  # Database subnets:
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  #   create_database_nat_gateway_route = true/false
  #   create_database_internet_gateway_route = true/false

  database_subnets = ["10.0.21.0/24", "10.0.22.0/24", "10.0.23.0/24"]

  # Enable NAT Gateway for 'private_subnets' (outbound Communication)
  enable_nat_gateway = true
  single_nat_gateway = true

  # Enable DNS Hostname
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Name = "public-subnets"
  }
  private_subnet_tags = {
    Name = "private-subnets"
  }
  database_subnet_tags = {
    Name = "database-subnets"
  }
  tags = {
    Owner       = "TsaR"
    Environment = "dev"
  }
  vpc_tags = {
    Name = "vpc-dev"
  }


}
