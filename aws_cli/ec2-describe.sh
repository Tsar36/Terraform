#!/bin/bash

# Determine which AZ suport your instance type:
aws ec2 describe-instance-type-offerings --location-type availability-zone --filters Name=instance-type,Values=t2.micro --region us-east-2 --output table