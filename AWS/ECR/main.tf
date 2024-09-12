provider "aws" {
  region = "us-east-2"  # Укажите свой регион
}

# Создание VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Создание подсети
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
}

# Создание Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
}

# Создание маршрута для выхода в интернет
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

resource "aws_route_table_association" "main" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.main.id
}

# Создание группы безопасности для ECS
resource "aws_security_group" "ecs_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Создание репозитория ECR для хранения Docker-образов
resource "aws_ecr_repository" "my_repo" {
  name = "my-docker-repo"
}

# Создание ECS кластера
resource "aws_ecs_cluster" "main" {
  name = "my-ecs-cluster"
}

# Роль выполнения для задач ECS
resource "aws_iam_role" "ecs_task_execution" {
  name = "ecs_task_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy" {
  role       = aws_iam_role.ecs_task_execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# Определение задачи ECS (с Docker-образом из ECR)
resource "aws_ecs_task_definition" "example" {
  family                = "example-task"
  network_mode          = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                   = "256"
  memory                = "512"
  execution_role_arn    = aws_iam_role.ecs_task_execution.arn
  container_definitions = jsonencode([{
    name  = "my-container"
    image = "${aws_ecr_repository.my_repo.repository_url}:latest"  # Docker-образ из ECR
    cpu   = 256
    memory = 512
    essential = true
    portMappings = [{
      containerPort = 80
      hostPort      = 80
    }]
  }])
}

# Создание ECS-сервиса
resource "aws_ecs_service" "main" {
  name            = "example-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.example.arn
  desired_count   = 2
  launch_type     = "FARGATE"
  network_configuration {
    subnets         = [aws_subnet.main.id]
    security_groups = [aws_security_group.ecs_sg.id]
  }
}