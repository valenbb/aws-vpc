resource "aws_vpc_dhcp_options" "esn-dhcp" {
  domain_name = "${var.DnsZoneName}"
  domain_name_servers = ["${var.DNSNameServers}"]
  tags {
    Name = "esn-dhcp default option set"
  }
}

resource "aws_vpc_dhcp_options_association" "esn-dhcp-association" {
  vpc_id          = "${aws_vpc.esn-vpc.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.esn-dhcp.id}"
}
