# Outputs

# VPC Private Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value = module.vpc.public_subnets
}

# VPC Public Subnets
output "public_subnets" {
  description = "List of IDs of public subnets"
  value = module.vpc.public_subnets
}

# VPC NAT Gateway Public IP
output "nat_public_ip" {
  description = "List of IDs of public subnets"
  value = module.vpc.nat_public_ips
}