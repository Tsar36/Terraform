module "vpc-instance" {
  source = "terraform-aws-modules/vpc/aws"

  name = "vpc-instance"
  cidr = "10.0.0.0/16"
  azs             = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  enable_nat_gateway = false # (should be true if you want to allow instances in private subnets to access the internet)
  enable_vpn_gateway = false # (should be true if you want to allow VPN connections to the VPC)

  map_public_ip_on_launch = false # (By default = false; should be true if you want instances in public subnets to have public IPs)
}