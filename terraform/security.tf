resource "aws_security_group" "hknews" {
  name        = "hknews"
  description = "HK News security group"
  vpc_id      = "${aws_vpc.hknews.id}"

  tags = {
    Name = "${var.tag}"
  }

  ingress {
    from_port = -1
    to_port   = -1
    protocol  = "icmp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]

    ipv6_cidr_blocks = [
      "::/0",
    ]
  }

  ingress {
    description = "SSH"
    from_port   = "${var.ssh_port}"
    to_port     = "${var.ssh_port}"
    protocol    = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  ingress {
    description = "HTTP"
    from_port   = "${var.http_port}"
    to_port     = "${var.http_port}"
    protocol    = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  ingress {
    description = "HTTPS"
    from_port   = "${var.https_port}"
    to_port     = "${var.https_port}"
    protocol    = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  ingress {
    description = "Grafana"
    from_port   = "${var.grafana_port}"
    to_port     = "${var.grafana_port}"
    protocol    = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  ingress {
    description = "Prometheus"
    from_port   = "${var.prometheus_port}"
    to_port     = "${var.prometheus_port}"
    protocol    = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
}

resource "aws_key_pair" "hknews" {
  key_name   = "hknews"
  public_key = "${file(var.public_key)}"
}
