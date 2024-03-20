### PROD EC2

resource "aws_instance" "Web1" {
  instance_type          = "t2.micro"
  ami                    = "ami-080e1f13689e07408"
  subnet_id              = aws_subnet.Web-1.id
  vpc_security_group_ids = [aws_security_group.WebNSG.id]
  key_name               = "Terraform_Cle_Web"
  tags = {
    Name = "Web1"
  }
}

resource "aws_instance" "Web2" {
  instance_type          = "t2.micro"
  ami                    = "ami-080e1f13689e07408"
  subnet_id              = aws_subnet.Web-2.id
  vpc_security_group_ids = [aws_security_group.WebNSG.id]
  key_name               = "Terraform_Cle_Web"
  tags = {
    Name = "Web2"
  }
}

resource "aws_instance" "Web3" {
  instance_type          = "t2.micro"
  ami                    = "ami-080e1f13689e07408"
  subnet_id              = aws_subnet.Web-3.id
  vpc_security_group_ids = [aws_security_group.WebNSG.id]
  key_name               = "Terraform_Cle_Web"
  tags = {
    Name = "Web3"
  }
}

### INTERNAL EC2


resource "aws_instance" "AdminBastion" {
  instance_type          = "t2.micro"
  ami                    = "ami-080e1f13689e07408"
  subnet_id              = aws_subnet.AZ-Admin.id
  vpc_security_group_ids = [aws_security_group.InternalNSG.id]
  key_name               = "Terraform_Cle_Admin"
  tags = {
    Name = "AdminBastion"
  }
}

resource "aws_instance" "WebDev-1" {
  instance_type          = "t2.micro"
  ami                    = "ami-080e1f13689e07408"
  subnet_id              = aws_subnet.WebDev-1
  vpc_security_group_ids = [aws_security_group.InternalNSG.id]
  key_name               = "Terraform_Cle_Web"
  tags = {
    Name = "Web1"
  }
}

resource "aws_instance" "WebDev-2" {
  instance_type          = "t2.micro"
  ami                    = "ami-080e1f13689e07408"
  subnet_id              = aws_subnet.WebDev-2.id
  vpc_security_group_ids = [aws_security_group.InternalNSG.id]
  key_name               = "Terraform_Cle_Web"
  tags = {
    Name = "Web2"
  }
}

resource "aws_instance" "WebDev-3" {
  instance_type          = "t2.micro"
  ami                    = "ami-080e1f13689e07408"
  subnet_id              = aws_subnet.WebDev-3.id
  vpc_security_group_ids = [aws_security_group.InternalNSG.id]
  key_name               = "Terraform_Cle_Web"
  tags = {
    Name = "Web3"
  }
}