resource "aws_internet_gateway" "hknews" {
  vpc_id = aws_vpc.hknews.id

  tags = {
    Name = var.tag
  }
}
