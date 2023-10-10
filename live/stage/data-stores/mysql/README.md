# MySQL on RDS example (staging environment)
This folder contains an example Terraform configuration that deploys a MySQL database (using RDS in an Amazon Web Services (AWS) account.


## Pre-requisites
You must have Terraform installed on your computer.
You must have an Amazon Web Services (AWS) account.
Please note that this code was written for Terraform 1.x.

## Quick start
Please note that this example will deploy real resources into your AWS account. We have made every effort to ensure all the resources qualify for the AWS Free Tier, but we are not responsible for any charges you may incur.

Configure your AWS access keys as environment variables:

'''
export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)
'''

Open main.tf, uncomment the backend configuration, and fill in the name of your S3 bucket, DynamoDB table, and the path to use for the Terraform state file.

Deploy the code:
'''
terraform init
terraform apply
'''

Clean up when you're done:
'''
terraform destroy
'''
