provider aws{
    region = var.region

}
resource "aws_vps" "kazien"{
    cidr_block = var.vps_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
}


resource "aws_vpc" "kaizen" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.kaizen.id
  map_public_ip_on_launch = var.ip_on_launch
  cidr_block = var.subnet1_cidr
  availability_zone ="us-west-2a"
}
resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.kaizen.id
  map_public_ip_on_launch = var.ip_on_launch
  cidr_block = var.subnet2_cidr
  availability_zone ="us-west-2b"
}
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.kaizen.id
  cidr_block = var.subnet3_cidr
  availability_zone ="us-west-2c"
}
resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.kaizen.id
  map_public_ip_on_launch = var.ip_on_launch
  cidr_block = var.subne4_cidr
  availability_zone ="us-west-2d"
}

resource "aws_internet_gateway" "homework5_igw" {
  vpc_id = aws_vpc.kaizen.id
}



resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.kaizen.id
   map_public_ip_on_launch = true

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.homework5_igw.id
  }

}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.homework5_igw.id
  }

}



resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private-rt.id

}
resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private-rt.id
}