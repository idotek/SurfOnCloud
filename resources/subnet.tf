## VPC PROD

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

resource "aws_internet_gateway" "PROD-gw" {
  vpc_id = aws_vpc.VPC-PROD.id

  tags = {
    Name = "PROD-GW"
  }
}

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

resource "aws_main_route_table_association" "RouteAndVPC" {
  vpc_id         = aws_vpc.VPC-PROD.id
  route_table_id = aws_route_table.PROD-Route.id
}


#### VPC INTERNAL



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


resource "aws_subnet" "AdminBastion" {
  vpc_id                  = aws_vpc.VPC-INTERNAL.id
  cidr_block              = "10.10.4.0/24"
  availability_zone       = "us-east-1d"
  map_public_ip_on_launch = true
  tags = {
    Name = "AZ-Admin"
  }
}


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

resource "aws_main_route_table_association" "RouteAndVPC" {
  vpc_id         = aws_vpc.VPC-INTERNAL.id
  route_table_id = aws_route_table.INTERNAL-Route.id
}