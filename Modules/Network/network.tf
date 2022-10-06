resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = "true"
  tags = {
    Name = "Piotrek-tf-vpc"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "Piotrek-tf-main-vpc-gateway"
  }
}

resource "aws_route_table" "piotrek-tf-rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    //associated subnet can reach everywhere
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Piotrek-tf-public-rt"
  }
}

resource "aws_route_table_association" "tf-rt-s1" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.piotrek-tf-rt.id
}

resource "aws_route_table_association" "tf-rt-s2" {
  subnet_id      = aws_subnet.my_subnet2.id
  route_table_id = aws_route_table.piotrek-tf-rt.id
}

resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  map_public_ip_on_launch = "true"
  cidr_block              = "10.0.0.0/24"
  availability_zone       = var.zoneA
  tags = {
    Name = "Piotrek-tf-subnet1"
  }
}

resource "aws_subnet" "my_subnet2" {
  vpc_id                  = aws_vpc.main_vpc.id
  map_public_ip_on_launch = "true"
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.zoneB
  tags = {
    Name = "Piotrek-tf-subnet2"
  }
}

resource "aws_security_group" "tf-alb_sg" {
  name        = "Piotrek-tf-alb-security-group"
  description = "Terraform load balancer security group"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}