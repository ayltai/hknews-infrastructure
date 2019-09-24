resource "aws_subnet" "hknews" {
  vpc_id            = aws_vpc.hknews.id
  availability_zone = var.zone
  cidr_block        = var.subnet_cidr_block

  tags = {
    Name = var.tag
  }
}

resource "aws_route_table" "hknews" {
  vpc_id = aws_vpc.hknews.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.hknews.id
  }

  tags = {
    Name = var.tag
  }
}

resource "aws_route_table_association" "hknews" {
  subnet_id      = aws_subnet.hknews.id
  route_table_id = aws_route_table.hknews.id
}
