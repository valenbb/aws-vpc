provider "aws" {
  region = "${var.aws_region}"
  version = "~> 1.2"
}

resource "aws_vpc" "esn-vpc" {
  cidr_block = "${var.vpc_fullcidr}"
  enable_dns_support = "${var.enable_dns_support}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"

  tags {
    Name = "esn-vpc"
  }
}
