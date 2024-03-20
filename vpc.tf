# Create VPC prod
resource "aws_vpc" "vpc_prod" {
  cidr_block = "10.20.0.0/16"

  tags = {
    Name = "VPC PROD"
  }
}

# Create VPC internal
resource "aws_vpc" "vpc_internal" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "VPC INTERNAL"
  }
}
#Création du VPC Peering
resource "aws_vpc_peering_connection" "vpc_peer" {
  peer_vpc_id   = aws_vpc.vpc_prod.id
  vpc_id        = aws_vpc.vpc_internal.id
  auto_accept = true

  tags = {
    Name = "VPC Peering entre Internal et Prod"
  }
}
