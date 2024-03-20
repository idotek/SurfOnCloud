# Création du VPC Prod
resource "aws_vpc" "vpc_prod" {
  cidr_block = "10.20.0.0/16"

  tags = {
    Name = "VPC PROD"
  }
}

# Création du VPC Internal
resource "aws_vpc" "vpc_internal" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "VPC INTERNAL"
  }
}
