resource "aws_vpc" "hknews" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.tag
  }
}

resource "aws_eip" "hknews" {
  instance = aws_instance.hknews[0].id
  vpc      = true

  tags = {
    Name = var.tag
  }
}

resource "aws_route53_zone" "hknews" {
  name = var.domain

  tags = {
    Name = var.tag
  }
}

resource "aws_route53_record" "hknews" {
  name    = var.domain
  zone_id = aws_route53_zone.hknews.zone_id
  type    = "A"
  ttl     = "3600"

  records = [
    aws_eip.hknews.public_ip,
  ]
}

resource "aws_route53_record" "hknews" {
  name    = "*.${var.domain}"
  zone_id = aws_route53_zone.hknews.zone_id
  type    = "A"
  ttl     = "3600"

  records = [
    aws_eip.hknews.public_ip,
  ]
}
