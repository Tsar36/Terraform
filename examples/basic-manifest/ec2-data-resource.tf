# Availability Zones Datasources
data "aws_availability_zones" "my_azones" {
  state = "available"
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# EC2 Instance
resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amz-linux2.id
  # instance_type = var.instance_type // for single use
  # instance_type = var.instance_type_list[1] // from list of types
  instance_type = var.instance_type_map["dev"]
  user_data              = file("${path.module}/app-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  # Create EC2 Instance in All Availability Zones of VPC
  for_each = toset(data.aws_availability_zones.my_azones.names)
  availability_zone = each.key
  #count                  = 2
  tags = {
  #  "Name" = "Count-Demo-${count.index}"
    "Name" = "For-Each-Demo-${each.value}"
  }
}
