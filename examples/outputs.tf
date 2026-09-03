data "aws_caller_identity" "current" {
  # This data source is used to retrieve information about the AWS account and the IAM user or role that is executing the Terraform code.
}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_caller_identity_arn" {
  value = data.aws_caller_identity.current.arn
}