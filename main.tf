provider "aws" {
  region = var.region
}

resource "aws_vpc" "exemplo_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "exemplo_subnet" {
  vpc_id                  = aws_vpc.exemplo_vpc.id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_route_table" "exemplo_route_table" {
  vpc_id = aws_vpc.exemplo_vpc.id

  route {
    cidr_block = var.egress_cidr
    gateway_id = aws_internet_gateway.exemplo_igw.id
  }
}

resource "aws_internet_gateway" "exemplo_igw" {
  vpc_id = aws_vpc.exemplo_vpc.id
}


resource "aws_security_group" "exemplo_sg" {
  name        = var.security_group_name

  ingress {
    from_port   = var.ingress_port
    to_port     = var.ingress_port
    protocol    = var.ingress_protocol
    cidr_blocks = [var.ingress_cidr]
  }

  egress {
    from_port   = var.egress_port
    to_port     = var.egress_port
    protocol    = var.egress_protocol
    cidr_blocks = [var.egress_cidr]
  }

  vpc_id = aws_vpc.exemplo_vpc.id
}

resource "aws_instance" "exemplo_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.exemplo_subnet.id
  vpc_security_group_ids = [aws_security_group.exemplo_sg.id]
  key_name = var.key_name

  tags = {
    Name = var.instance_name
  }
}
