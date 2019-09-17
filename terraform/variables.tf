variable "tag" {
  description = "The tag for all resources used in this application"
  default     = "hknews"
}

variable "region" {
  description = "AWS region"
  default     = "us-west-2"
}

variable "zone" {
  description = "Availability zone"
  default     = "us-west-2a"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/24"
}

variable "subnet_cidr_block" {
  description = "CIDR block for subnet"
  default     = "10.0.0.0/28"
}

variable "ami_filter" {
  description = "AMI filter"
  default     = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
}

variable "ami_owner" {
  description = "AMI owner is Canonical"
  default     = "099720109477"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "instance_count" {
  description = "Number of EC2 instances"
  default     = 1
}

variable "storage_size" {
  description = "The size of the storage attached to EC2 instances"
  default     = 20
}

variable "ami_key_name" {
  description = "AMI key pair name"
  default     = "hknews"
}

variable "public_key" {
  description = "EC2 instance public key"
  default     = "~/.ssh/hknews.pub"
}

variable "private_key" {
  description = "EC2 instance private key"
  default     = "~/.ssh/hknews.pem"
}

variable "ssh_port" {
  description = "The port for handling SSH requests"
  default     = 22
}

variable "http_port" {
  description = "The port used for creating ACME certificate using http-01 challenge"
  default     = 80
}

variable "https_port" {
  description = "The port for handling HTTPS web requests"
  default     = 443
}

variable "prometheus_port" {
  description = "The port for handling Prometheus server requests"
  default     = 9090
}

variable "grafana_port" {
  description = "The port for handling Grafana server requests"
  default     = 3000
}

variable "user" {
  description = "AMI user"
  default     = "ubuntu"
}

variable "domain" {
  description = "Public domain name"
  default     = "hknews.dev"
}
