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
#Création du VPC Peering
resource "aws_vpc_peering_connection" "vpc_peer" {
  peer_vpc_id   = aws_vpc.vpc_prod.id
  vpc_id        = aws_vpc.vpc_internal.id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags = {
    Name = "VPC Peering entre Internal et Prod"
  }
}
