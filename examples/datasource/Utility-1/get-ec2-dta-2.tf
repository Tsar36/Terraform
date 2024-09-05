# EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amz-linux2.id
  instance_type = var.instance_type_map["dev"]
  user_data              = file("${path.module}/app-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  # Create EC2 Instance in All Availability Zones of VPC
 for_each = toset(keys({for az, details in data.aws_ec2_instance_type_offering.my_ins_type: az => details.instance_types if length(details.instance_types) != 0 }))
  availability_zone = each.key
  tags = {
  #  "Name" = "Count-Demo-${count.index}"
    "Name" = "For-Each-Demo-${each.key}"
  }
}