Auto Scaling Group with Rolling Deploy
This folder contains an example Terraform configuration that defines a module for deploying a cluster of web servers (using EC2 and Auto Scaling) in an Amazon Web Services (AWS) account. The Auto Scaling Group is able to do a zero-downtime deployment (using instance refresh) when you update any of its properties.

For more info, please see Chapter 10, "How to use Terraform as a Team", of Terraform: Up and Running.

Quick start
Terraform modules are not meant to be deployed directly. Instead, you should be including them in other Terraform configurations. See live/stage/services/hello-world-app and live/prod/services/hello-world-app for examples.