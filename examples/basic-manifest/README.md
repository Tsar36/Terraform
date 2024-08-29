# The basic manifest
It runs a simple 'Apache Webserver' on an AWS EC2 (t2.micro) instance with 'user-data' script (app-install.sh)

## To run use this commands:
```
terraform validate
terraform plan
terraform apply --auto-approve
```

then check your public IP address.

## To delete use this commands:
```
terraform destroy --auto-approve
```