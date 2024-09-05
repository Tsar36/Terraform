/* 1. Get list of Availability Zones in a Specific region */

data "aws_availability_zones" "my_azones" {
  state = "available"
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

/*
 2. Datasource. Check if t2.micro instance type is supported in specific Availability Zones
*/
data "aws_ec2_instance_type_offerings" "my_ins_type" {
  location_type = "availability-zone"
  filter {
    name   = "instance-type"
    values = ["t2.micro"]
  }
  filter {
    name   = "location"
    values = data.aws_availability_zones.my_azones.names
  }
}

/* Output the available instance types */
output "available_instance_types" {
  value = data.aws_ec2_instance_type_offerings.my_ins_type.instance_types
}

/* Output the available zones */
output "available_zones" {
  value = data.aws_ec2_instance_type_offerings.my_ins_type.locations
}

/* Output instance types by availability zone */
output "instance_types_by_zone" {
  value = { for i, az in data.aws_ec2_instance_type_offerings.my_ins_type.locations : az => data.aws_ec2_instance_type_offerings.my_ins_type.instance_types[i] }
}

output "debug_instance_type_offerings" {
  value = data.aws_ec2_instance_type_offerings.my_ins_type
}