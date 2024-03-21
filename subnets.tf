### Production ###

# Create prod servers subnets
resource "aws_subnet" "subnet_01_prod" {
  vpc_id                  = aws_vpc.vpc_prod.id
  cidr_block              = "10.20.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet prod 01"
  }
}

resource "aws_subnet" "subnet_02_prod" {
  vpc_id                  = aws_vpc.vpc_prod.id
  cidr_block              = "10.20.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet prod 02"
  }
}

resource "aws_subnet" "subnet_03_prod" {
  vpc_id                  = aws_vpc.vpc_prod.id
  cidr_block              = "10.20.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet prod 03"
  }
}


### Internal ###

# Create internal servers subnets
resource "aws_subnet" "subnet_01_internal" {
  vpc_id                  = aws_vpc.vpc_internal.id
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet internal 01"
  }
}

resource "aws_subnet" "subnet_02_internal" {
  vpc_id                  = aws_vpc.vpc_internal.id
  cidr_block              = "10.10.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet internal 02"
  }
}

resource "aws_subnet" "subnet_03_internal" {
  vpc_id                  = aws_vpc.vpc_internal.id
  cidr_block              = "10.10.3.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet internal 03"
  }
}

# Create admin subnet
resource "aws_subnet" "subnet_04_internal" {
  vpc_id                  = aws_vpc.vpc_internal.id
  cidr_block              = "10.10.4.0/24"
  availability_zone       = "us-east-1d"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet internal admin"
  }
}
