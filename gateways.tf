# Creation of the Internet Gateway for the Prod VPC
resource "aws_internet_gateway" "prod_igw" {
  vpc_id = aws_vpc.vpc_prod.id

  tags = {
    Name = "PROD-GW"
  }
}

# Creation of the Internet Gateway for the Internal VPC
resource "aws_internet_gateway" "internal_igw" {
  vpc_id = aws_vpc.vpc_internal.id

  tags = {
    Name = "INTERNAL-GW"
  }
}
#Creation of the Virtual private gateway for the Internal VPC
