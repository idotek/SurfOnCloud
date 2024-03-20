### Production ###

# Create Prod route table
resource "aws_route_table" "prod_route_table" {
  vpc_id = aws_vpc.vpc_prod.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod_igw.id
  }

  route {
    cidr_block = "10.20.0.0/16"
    gateway_id = "local"
  }
  tags = {
    Name = "Prod Route Table"
  }
}

# Link prod route table to prod vpc
resource "aws_main_route_table_association" "prod_route_table_association" {
  vpc_id         = aws_vpc.vpc_prod.id
  route_table_id = aws_route_table.prod_route_table.id
}


### Internal ###

# Create Internal route table
resource "aws_route_table" "internal_route_table" {
  vpc_id = aws_vpc.vpc_internal.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internal_igw.id
  }

  route {
    cidr_block = "10.10.0.0/16"
    gateway_id = "local"
  }
  tags = {
    Name = "Internal Route Table"
  }
}

# Link prod route table to internal vpc
resource "aws_main_route_table_association" "internal_route_table_association" {
  vpc_id         = aws_vpc.vpc_internal.id
  route_table_id = aws_route_table.internal_route_table.id
}