resource "aws_subnet" "public_subnet1" {
  vpc_id                  = "${aws_vpc.esn-vpc.id}"
  cidr_block              = "${var.public_subnet1_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "${var.public_subnet1_az}"

  tags {
  	Name =  "Public-Subnet1-AZ"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = "${aws_vpc.esn-vpc.id}"
  cidr_block              = "${var.public_subnet2_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "${var.public_subnet2_az}"

  tags {
  	Name =  "Public-Subnet2-AZ"
  }
}

resource "aws_subnet" "private_web_subnet1" {
  vpc_id                  = "${aws_vpc.esn-vpc.id}"
  cidr_block              = "${var.private_web_subnet1_cidr}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"
  availability_zone = "${var.private_subnet1_az}"

  tags {
  	Name =  "Private-Web-Subnet1-AZ"
  }
}

resource "aws_subnet" "private_web_subnet2" {
  vpc_id                  = "${aws_vpc.esn-vpc.id}"
  cidr_block              = "${var.private_web_subnet2_cidr}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"
  availability_zone = "${var.private_subnet2_az}"

  tags {
  	Name =  "Private-Web-Subnet2-AZ"
  }
}

resource "aws_subnet" "private_rds_subnet1" {
  vpc_id                  = "${aws_vpc.esn-vpc.id}"
  cidr_block              = "${var.private_rds_subnet1_cidr}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"
  availability_zone = "${var.private_subnet1_az}"

  tags {
  	Name =  "Private-RDS-Subnet1-AZ"
  }
}

resource "aws_subnet" "private_rds_subnet2" {
  vpc_id                  = "${aws_vpc.esn-vpc.id}"
  cidr_block              = "${var.private_rds_subnet2_cidr}"
  map_public_ip_on_launch = "${var.map_public_ip_on_launch}"
  availability_zone = "${var.private_subnet2_az}"

  tags {
  	Name =  "Private-RDS-Subnet2-AZ"
  }
}
