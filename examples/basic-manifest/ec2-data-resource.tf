# EC2 Instance

resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.amz-linux2.id
  # instance_type = var.instance_type
  #instance_type = var.instance_type_list[1]
  instance_type = var.instance_type_map["dev"]
  user_data              = file("${path.module}/app-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  count                  = 2
  tags = {
    "Name" = "Count-Demo-${count.index}"
  }
}
