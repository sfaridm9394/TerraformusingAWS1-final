resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr_block

}

resource "aws_subnet" "sub1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.cidr_block1
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  
  tags = {
    name = "mypubsub"
  }
}

resource "aws_subnet" "sub2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.cidr_block2
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    name = "mypubsub1"
  }
}

resource "aws_subnet" "privatesub1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.cidr_block4
  availability_zone = "us-east-1a"
  tags = {
    name = "myprivatesub1"
  }
}

resource "aws_subnet" "privatesub2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.cidr_block5
  availability_zone = "us-east-1b"
  tags = {
    name = "myprivatesub2"
  }
}
resource "aws_internet_gateway" "myIGW" {
  vpc_id = aws_vpc.myvpc.id

}

resource "aws_route_table" "myRT" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = var.cidr_block3
    gateway_id = aws_internet_gateway.myIGW.id
  }

}

resource "aws_route_table_association" "RTassociate" {
  subnet_id      = aws_subnet.sub1.id
  route_table_id = aws_route_table.myRT.id

}

resource "aws_route_table_association" "RTassociate1" {
  subnet_id      = aws_subnet.sub2.id
  route_table_id = aws_route_table.myRT.id

}

resource "aws_eip" "nat_eip_1" {

}

resource "aws_eip" "nat_eip_2" {

}

resource "aws_nat_gateway" "natgw_1" {
  allocation_id = aws_eip.nat_eip_1.id
  subnet_id     = aws_subnet.sub1.id # public subnet us-east-1a

  tags = {
    Name = "nat-gw-1a"
  }
}

resource "aws_nat_gateway" "natgw_2" {
  allocation_id = aws_eip.nat_eip_2.id
  subnet_id     = aws_subnet.sub2.id # public subnet us-east-1b

  tags = {
    Name = "nat-gw-1b"
  }
}

resource "aws_route_table" "priv_rt_1" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block     = var.cidr_block6
    nat_gateway_id = aws_nat_gateway.natgw_1.id
  }

  tags = {
    Name = "private-rt-1a"
  }
}

resource "aws_route_table_association" "private_sub1_association" {
  subnet_id      = aws_subnet.privatesub1.id
  route_table_id = aws_route_table.priv_rt_1.id # ✅ Correct
}

resource "aws_route_table" "priv_rt_2" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block     = var.cidr_block7
    nat_gateway_id = aws_nat_gateway.natgw_2.id
  }

  tags = {
    Name = "private-rt-1b"
  }
}

resource "aws_route_table_association" "private_sub2_association" {
  subnet_id      = aws_subnet.privatesub2.id
  route_table_id = aws_route_table.priv_rt_2.id # ✅ Correct
}