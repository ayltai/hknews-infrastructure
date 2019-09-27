resource "aws_vpc" "hknews" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.tag
  }
}

resource "aws_eip" "hknews" {
  instance   = aws_instance.hknews[0].id
  vpc        = true
  depends_on = [
    "aws_internet_gateway.hknews"
  ]

  tags = {
    Name = var.tag
  }
}
