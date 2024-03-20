resource "aws_vpc" "VPC-PROD" {
  cidr_block = "10.20.0.0/16"

  tags = {
    Name = "VPC-PROD"
  }
}

resource "aws_vpc" "VPC-INTERNAL" {
  cidr_block = "10.10.0.0/16"

  tags = {
    Name = "VPC-INTERNAL"
  }
}

### VPC PEERING pour interco

