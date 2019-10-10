terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
  version    = "~> 2.26"
}

provider "null" {
  version = "~> 2.1"
}

output "public_ip" {
  value = aws_eip.hknews.public_ip
}
