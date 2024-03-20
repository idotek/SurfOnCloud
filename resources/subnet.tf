## VPC PROD
#Création des subnets des serveurs web
resource "aws_subnet" "Web-1" {
  vpc_id                  = aws_vpc.VPC-PROD.id
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "AZ-A"
  }
}

resource "aws_subnet" "Web-2" {
  vpc_id                  = aws_vpc.VPC-PROD.id
  cidr_block              = "10.20.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "AZ-B"
  }
}

resource "aws_subnet" "Web-3" {
  vpc_id                  = aws_vpc.VPC-PROD.id
  cidr_block              = "10.20.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "AZ-C"
  }
}
#Création du subnet de la base de données
resource "aws_subnet" "RDS" {
  vpc_id                  = aws_vpc.VPC-PROD.id
  cidr_block              = "10.20.4.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "RDS-Subnet"
  }
}
#Création de la passerelle internet pour le VPC Prod
resource "aws_internet_gateway" "PROD-gw" {
  vpc_id = aws_vpc.VPC-PROD.id

  tags = {
    Name = "PROD-GW"
  }
}
#Création de la table de routage du VPC Prod
resource "aws_route_table" "PROD-Route" {
  vpc_id = aws_vpc.VPC-PROD.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.PROD-gw.id
  }

  route {
    cidr_block = "10.20.0.0/16"
    gateway_id = "local"
  }
  tags = {
    Name = "PROD-Routing"
  }
}
#Association de la table de routage au VPC Prod
resource "aws_main_route_table_association" "RouteAndVPC" {
  vpc_id         = aws_vpc.VPC-PROD.id
  route_table_id = aws_route_table.PROD-Route.id
}


#### VPC INTERNAL


#Création des subnets pour les application mobile
resource "aws_subnet" "WebDev-1" {
  vpc_id                  = aws_vpc.VPC-INTERNAL.id
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "AZ-A"
  }
}

resource "aws_subnet" "WebDev-2" {
  vpc_id                  = aws_vpc.VPC-INTERNAL.id
  cidr_block              = "10.10.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "AZ-B"
  }
}

resource "aws_subnet" "WebDev-3" {
  vpc_id                  = aws_vpc.VPC-INTERNAL.id
  cidr_block              = "10.10.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "AZ-C"
  }
}

#Création du subnet pour la machine admin
resource "aws_subnet" "AdminBastion" {
  vpc_id                  = aws_vpc.VPC-INTERNAL.id
  cidr_block              = "10.10.4.0/24"
  availability_zone       = "us-east-1d"
  map_public_ip_on_launch = true
  tags = {
    Name = "AZ-Admin"
  }
}

#Création de la passerelle internet pour le VPC Internal
resource "aws_internet_gateway" "INTERNAL-gw" {
  vpc_id = aws_vpc.VPC-INTERNAL.id

  tags = {
    Name = "INTERNAL-GW"
  }
}

resource "aws_route_table" "INTERNAL-Route" {
  vpc_id = aws_vpc.VPC-INTERNAL.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.INTERNAL-gw.id
  }

  route {
    cidr_block = "10.10.0.0/16"
    gateway_id = "local"
  }
  tags = {
    Name = "INTERNAL-Routing"
  }
}
#Association de la table de routage au VPC Internal
resource "aws_main_route_table_association" "RouteAndVPC-Internal" {
  vpc_id         = aws_vpc.VPC-INTERNAL.id
  route_table_id = aws_route_table.INTERNAL-Route.id
}