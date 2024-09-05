# Datasource. Check if the type of instance is supports by AZ.
data "aws_ec2_instance_type_offering" "my_ins_type1" {
    for_each = toset(["us-east-2a", "us-east-2b", "us-east-2c"]) # with 'output_v2'
  filter {
    name   = "instance-type"
    values = ["t2.micro"]
  }
  filter {
    name   = "location"
    values = [each.key]
    # values = ["us-east-2e"] # Don't support
  }
  location_type = "availability-zone"
}

# output "output_v1_1" {
#   value = data.aws_ec2_instance_type_offering.my_ins_type1.instance_type
# }
## output with 'for_each'
output "output_v2" {
  value = toset([for t in data.aws_ec2_instance_type_offering.my_ins_type1: t.instance_type])
}
output "output_v2_1" {
  value = {
    for az, details in data.aws_ec2_instance_type_offering.my_ins_type1: az => details.instance_type
  }
}