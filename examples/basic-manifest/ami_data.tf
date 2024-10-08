# Get latest AMI for Amazon Linux2 OS
data "aws_ami" "amz-linux2" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*gp2" ]
  }

  filter {
    name = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}