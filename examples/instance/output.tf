output "instance_ids" {
  description = "The IDs of the created EC2 instances"
  value       = aws_instance.example[*].id
}

output "instance_public_ips" {
  description = "The public IP addresses of the created EC2 instances"
  value       = aws_instance.example[*].public_ip
}

output "instance_private_ips" {
  description = "The private IP addresses of the created EC2 instances"
  value       = aws_instance.example[*].private_ip
}

output "instance_arn" {
  description = "The ARN of the created EC2 instances"
  value       = aws_instance.example[*].arn
}

output "instance_tags" {
  description = "The tags of the created EC2 instances"
  value       = aws_instance.example[*].tags
}

output "instance_state" {
  description = "The state of the created EC2 instances"
  value       = aws_instance.example[*].instance_state
}

output "instance_availability_zone" {
  description = "The availability zone of the created EC2 instances"
  value       = aws_instance.example[*].availability_zone
}

output "public_subnets" {
  description = "The public subnets of the created EC2 instances"
  value       = module.vpc-instance.public_subnets
}