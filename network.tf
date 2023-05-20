resource "aws_vpc" "demo_vpc" {
  cidr_block                       = var.cidr_block
  instance_tenancy                 = "default"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = false
  tags = {
    Name = "demo_vpc"
  }
}


resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = "192.168.0.0/18"
  availability_zone       = "eu-west-3a"
  tags = {
    Name                   = "public-eu-west-3a"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = "192.168.128.0/18"
  availability_zone = "eu-west-3a"
  tags = {
    Name            = "private-eu-west-3a"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.demo_vpc.id
  cidr_block        = "192.168.192.0/18"
  availability_zone = "eu-west-3b"
  tags = {
    Name                                     = "private-eu-west-3b"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = "main"
  }
}

# resource "aws_network_interface" "network_interface" {
#   subnet_id       = aws_subnet.public_subnet.id
#   source_dest_check = false
#   security_groups = [aws_security_group.nat-sec-grp.id]

#   tags = {
#     Name = "nat_instance_network_interface"
#   }
  
# }

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public-route"
  }
}

resource "aws_route_table" "private_route" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    instance_id = aws_instance.nat_instance.id
  }
  
  tags = {
    Name = "private-route"
  }
}

resource "aws_route_table_association" "public_route_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route.id
}
  
resource "aws_route_table_association" "priate_route_association1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_route.id
}
  
resource "aws_route_table_association" "private_route_association2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_route.id
}