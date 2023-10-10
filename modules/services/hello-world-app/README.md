Hello World App
This folder contains an example Terraform configuration that defines a module for deploying a simple "Hello, World app" across a cluster of web servers (using EC2 and Auto Scaling) with a load balancer (using ELB) in an Amazon Web Services (AWS) account.


Quick start
Terraform modules are not meant to be deployed directly. Instead, you should be including them in other Terraform configurations. See live/stage/services/hello-world-app and live/prod/services/hello-world-app for examples.