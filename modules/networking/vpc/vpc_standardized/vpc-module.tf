# Terraform module which creates VPC Resources on AWS
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  # VPC Basic details:
  name            = "${local.name}-${var.vpc_name}"
  cidr            = var.vpc_cidr_block
  azs             = var.vpc_availability_zones
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  # Database subnets:
  create_database_subnet_group       = true
  create_database_subnet_route_table = true
  # create_database_nat_gateway_route = true
  # create_database_internet_gateway_route = true
  database_subnets = var.vpc_database_subnets

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
