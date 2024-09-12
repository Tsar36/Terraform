provider "aws" {
  region = "us-west-2"
}

# Создание VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "my-vpc"
  }
}

# Создание первой подсети в зоне доступности us-west-2a
resource "aws_subnet" "subnet_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"

  tags = {
    Name = "my-subnet-a"
  }
}

# Создание второй подсети в зоне доступности us-west-2b
resource "aws_subnet" "subnet_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-2b"

  tags = {
    Name = "my-subnet-b"
  }
}

# Использование модуля EKS
module "eks" {
  source      = "./module"
  cluster_name = "my-eks-cluster"
  vpc_id       = aws_vpc.main.id
  subnet_ids   = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]  # Добавляем обе подсети
}

# Выходные данные
output "eks_cluster_id" {
  value = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_vpc_id" {
  value = aws_vpc.main.id
}

output "eks_subnet_ids" {
  value = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
}

output "eks_node_group_name" {
  value = module.eks.node_group_name
}