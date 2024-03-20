# Define instance type and image
data "aws_ec2_instance_type" "default_instance_type" {
  instance_type = "t2.micro"
}

# Debian 12
data "aws_ami" "debian_12" {
  most_recent = true
  owners      = ["136693071363"] # Debian owner
  filter {
    name   = "name"
    values = ["debian-12-amd64-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}