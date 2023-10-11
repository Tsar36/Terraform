# Hello-world app example (staging environment)
This folder contains an example Terraform configuration that deploys a simple "Hello, World" application across a cluster of web servers (using EC2 and Auto Scaling) in an Amazon Web Services (AWS) account. This module also adds a listener rule to a load balancer (using ELB) to respond with "Hello, World" to the / URL.

For more info, please see Chapter 10, "How to use Terraform as a Team", of Terraform: Up and Running.

## Pre-requisites
You must have Terraform installed on your computer.
You must have an Amazon Web Services (AWS) account.
You must deploy the MySQL database in data-stores/mysql BEFORE deploying the configuration in this folder.
Please note that this code was written for Terraform 1.x.

## Quick start
Please note that this example will deploy real resources into your AWS account. We have made every effort to ensure all the resources qualify for the AWS Free Tier, but we are not responsible for any charges you may incur.

Configure your AWS access keys as environment variables:

export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
In variables.tf, fill in the name of the S3 bucket and key where the remote state is stored for the MySQL database and ALB (you must deploy the configurations in data-stores/mysql first):

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket used for the database's remote state storage"
  type        = string
  default     = "<YOUR BUCKET NAME>"
}

variable "db_remote_state_key" {
  description = "The name of the key in the S3 bucket used for the database's remote state storage"
  type        = string
  default     = "<YOUR STATE PATH>"
}
Deploy the code:

'''
terraform init
terraform apply

'''
When the apply command completes, it will output the DNS name of the load balancer. To test the load balancer:

curl http://<alb_dns_name>/
Clean up when you're done:

terraform destroy