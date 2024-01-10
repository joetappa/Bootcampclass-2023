# VPC
resource "aws_vpc" "my_vpc" {
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    tags = {
      "Name" = "my_vpc"
    }
}

# 2 Subnets
resource "aws_subnet" "subnets" {
  for_each = var.subnet_cidr
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = each.value
 availability_zone = data.aws_availability_zones.available.names[
    index(keys(var.subnet_cidr), each.key)
 ]
  tags = {
    Name = each.key
  }
}




# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "MyInternetGateway"
  }
}

# Route Table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0" # public 
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "Name" = "MyRouteTable"
  }
}

# Route Table Association
resource "aws_route_table_association" "rta" {
  for_each = aws_subnet.subnets
  subnet_id      = each.value.id
  route_table_id = aws_route_table.rt.id
}
