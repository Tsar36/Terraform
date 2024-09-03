# EC2 Instance IP // for single instance
# output "instance_publicip" {
#   description = "EC2 Instance Public IP"
#   value = aws_instance.myec2vm.public_ip
# }

# output "instance_publicdns" {
#   description = "EC2 Instance Public DNS"
#   value = aws_instance.myec2vm.public_dns
# }

# EC2 IP. Accessing a Specific Instance
# output "instance_publicip" {
#   value = aws_instance.myec2vm[0].public_ip
# }

# EC2 Public IP. TOSET. Accessing All Instances // If set 'count' meta-argument
output "instance_publicip" {
  value = toset([for instance in aws_instance.myec2vm : instance.public_ip])
}

### EC2 Instance Public DNS // if set 'count' meta
# with TOSET
output "instance_publicdns" {
  value = toset([for instance in aws_instance.myec2vm : instance.public_dns])
}
# With TOMAP:
output "instance_publicdns2" {
  value = tomap({ for az, instance in aws_instance.myec2vm : az => instance.public_dns })
}


### Legacy Splat. Outputs which comes up with 'count =' ###
# Output - For Loop with list
# output "for_output_list" {
#   description = "For Loop with list"
#   value = [for instance in aws_instance.myec2vm: instance.public_dns]
# }
# # Output - For Loop with Map
# output "for_output_map-1" {
#   description = "For Loop with Map"
#   value = {for instance in aws_instance.myec2vm: instance.id => instance.public_dns}
# }
# # Output - For Loop with Map (Advanced)
# output "for_output_map-2" {
#   description = "For Loop with Map - Advanced"
#   value = {for c, instance in aws_instance.myec2vm: c => instance.public_dns}
# }
# Output Legacy Splat Operator (Legacy) - Return the list
/* Deprecated
output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Operator"
  value = aws_instance.myec2vm.*.public_dns
}
*/
# Output Latest Generalized Splat Operator - Returns the list
# output "Latest_splat_instance_publicdns" {
#   description = "Generalized latest Splat Operator"
#   value = aws_instance.myec2vm[*].public_dns
# }
