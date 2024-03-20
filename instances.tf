### PROD Instances
# Création des Serveurs Web
resource "aws_instance" "web_01_prod" {
  instance_type          = data.aws_ec2_instance_type.default_instance_type.instance_type
  ami                    = data.aws_ami.debian_12.id
  subnet_id              = aws_subnet.subnet_01_prod.id
  vpc_security_group_ids = [aws_security_group.prod_servers_nsg.id]
  key_name               = aws_key_pair.gen_prod_servers_public_key.key_name
  tags = {
    Name = "Prod server 01"
  }
}

resource "aws_instance" "web_02_prod" {
  instance_type          = data.aws_ec2_instance_type.default_instance_type.instance_type
  ami                    = data.aws_ami.debian_12.id
  subnet_id              = aws_subnet.subnet_02_prod.id
  vpc_security_group_ids = [aws_security_group.prod_servers_nsg.id]
  key_name               = aws_key_pair.gen_prod_servers_public_key.key_name
  tags = {
    Name = "Prod server 02"
  }
}

resource "aws_instance" "web_03_prod" {
  instance_type          = data.aws_ec2_instance_type.default_instance_type.instance_type
  ami                    = data.aws_ami.debian_12.id
  subnet_id              = aws_subnet.subnet_03_prod.id
  vpc_security_group_ids = [aws_security_group.prod_servers_nsg.id]
  key_name               = aws_key_pair.gen_prod_servers_public_key.key_name
  tags = {
    Name = "Prod server 03"
  }
}

### INTERNAL Instances

# Create dev servers
resource "aws_instance" "server_01_internal" {
  instance_type          = data.aws_ec2_instance_type.default_instance_type.instance_type
  ami                    = data.aws_ami.debian_12.id
  subnet_id              = aws_subnet.subnet_01_internal.id
  vpc_security_group_ids = [aws_security_group.internal_servers_nsg.id]
  key_name               = aws_key_pair.gen_internal_servers_public_key.key_name
  tags = {
    Name = "Internal server 01"
  }
}

resource "aws_instance" "server_02_internal" {
  instance_type          = data.aws_ec2_instance_type.default_instance_type.instance_type
  ami                    = data.aws_ami.debian_12.id
  subnet_id              = aws_subnet.subnet_02_internal.id
  vpc_security_group_ids = [aws_security_group.internal_servers_nsg.id]
  key_name               = aws_key_pair.gen_internal_servers_public_key.key_name
  tags = {
    Name = "Internal server 02"
  }
}

resource "aws_instance" "server_03_internal" {
  instance_type          = data.aws_ec2_instance_type.default_instance_type.instance_type
  ami                    = data.aws_ami.debian_12.id
  subnet_id              = aws_subnet.subnet_03_internal.id
  vpc_security_group_ids = [aws_security_group.internal_servers_nsg.id]
  key_name               = aws_key_pair.gen_internal_servers_public_key.key_name
  tags = {
    Name = "Internal server 03"
  }
}

# Création de la machine Admin faisant office de Bastion
resource "aws_instance" "server_04_internal" {
  instance_type          = data.aws_ec2_instance_type.default_instance_type.instance_type
  ami                    = data.aws_ami.debian_12.id
  subnet_id              = aws_subnet.subnet_04_internal.id
  vpc_security_group_ids = [aws_security_group.internal_admin_nsg.id]
  key_name               = aws_key_pair.gen_admin_public_key.key_name
  tags = {
    Name = "Admin server"
  }
}
