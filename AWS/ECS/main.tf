provider "aws" {
  region = "us-east-2"
}

resource "aws_ecs_cluster" "example" {
  name = "example-cluster"
}

resource "aws_ecs_task_definition" "example" {
  family                = "example-task"
  network_mode          = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                   = "256"
  memory                = "512"
  execution_role_arn    = aws_iam_role.ecs_task_execution.arn
  container_definitions = jsonencode([{
    name  = "my-container"
    image = "my-docker-image"
    cpu   = 256
    memory = 512
    essential = true
  }])
}

resource "aws_ecs_service" "example" {
  name            = "example-service"
  cluster         = aws_ecs_cluster.example.id
  task_definition = aws_ecs_task_definition.example.arn
  desired_count   = 2
  launch_type     = "FARGATE"
  network_configuration {
    subnets         = aws_subnet.main.*.id
    security_groups = [aws_security_group.ecs_sg.id]
  }
}