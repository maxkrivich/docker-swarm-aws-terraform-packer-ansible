resource "aws_vpc" "swarm_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  instance_tenancy     = "default"

  tags = {
    VPC  = var.vpc_key
    Name = "${var.vpc_key}-vpc-swarm"
  }
}

resource "aws_subnet" "a" {
  vpc_id                  = aws_vpc.swarm_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.swarm_vpc.cidr_block, 8, 1)
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = false

  tags = {
    VPC  = var.vpc_key
    Name = "${var.vpc_key}-vpc-subnet-a-swarm"
  }
}

resource "aws_subnet" "b" {
  vpc_id                  = aws_vpc.swarm_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.swarm_vpc.cidr_block, 8, 2)
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = false

  tags = {
    VPC  = var.vpc_key
    Name = "${var.vpc_key}-vpc-subnet-b-swarm"
  }
}

resource "aws_subnet" "c" {
  vpc_id                  = aws_vpc.swarm_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.swarm_vpc.cidr_block, 8, 3)
  availability_zone       = "${var.region}c"
  map_public_ip_on_launch = false

  tags = {
    VPC  = var.vpc_key
    Name = "${var.vpc_key}-vpc-subnet-c-swarm"
  }
}

resource "aws_internet_gateway" "swarm_igw" {
  vpc_id = aws_vpc.swarm_vpc.id

  tags = {
    Name = "${var.vpc_key}-ig-swarm"
    VPC  = var.vpc_key
  }
}

resource "aws_network_acl" "network" {
  vpc_id = aws_vpc.swarm_vpc.id
  subnet_ids = [
    aws_subnet.a.id,
    aws_subnet.b.id,
    aws_subnet.c.id
  ]

  ingress {
    from_port  = 0
    to_port    = 0
    rule_no    = 100
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  }

  egress {
    from_port  = 0
    to_port    = 0
    rule_no    = 100
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = "${var.vpc_key}-network"
    VPC  = var.vpc_key
  }
}

resource "aws_route_table" "main" {
  vpc_id = aws_vpc.swarm_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.swarm_igw.id
  }

  tags = {
    Name = "${var.vpc_key}-route-swarm"
    VPC  = var.vpc_key
  }
}

resource "aws_route_table_association" "a" {
  route_table_id = aws_route_table.main.id
  subnet_id      = aws_subnet.a.id
}

resource "aws_route_table_association" "b" {
  route_table_id = aws_route_table.main.id
  subnet_id      = aws_subnet.b.id
}

resource "aws_route_table_association" "c" {
  route_table_id = aws_route_table.main.id
  subnet_id      = aws_subnet.c.id
}
