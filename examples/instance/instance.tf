provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type["example"]
  count         = 2

  subnet_id = module.vpc-instance.public_subnets[0]

  tags = {
	Name = "example-${count.index + 1}" /// a mathematical operation that shifts the numbering so that server names are more human-readable (starting with 1 instead of 0).
  }
}