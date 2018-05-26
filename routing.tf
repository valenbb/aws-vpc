# Declare the data source
data "aws_availability_zones" "available" {}

resource "aws_internet_gateway" "esn_gw" {
  vpc_id = "${aws_vpc.esn-vpc.id}"

  tags {
        Name = "InternetGateway"
    }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.esn-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.esn_gw.id}"
  }

  tags {
    Name = "ESN Public route table"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.esn-vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.esn_nat.id}"
  }

  tags {
    Name = "ESN Private route table"
  }
}

resource "aws_eip" "nat_eip" {
  vpc      = true
  depends_on = ["aws_internet_gateway.esn_gw"]
}

resource "aws_nat_gateway" "esn_nat" {
    allocation_id = "${aws_eip.nat_eip.id}"
    subnet_id = "${aws_subnet.public_subnet1.id}"
    depends_on = ["aws_internet_gateway.esn_gw"]

    tags {
    Name = "ESN-NAT"
  }
}
