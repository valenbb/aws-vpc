#===========================
# Public NACL and Rules
#===========================
resource "aws_network_acl" "public" {
   vpc_id = "${aws_vpc.esn-vpc.id}"
    egress {
        protocol = "-1"
        rule_no = 2
        action = "allow"
        cidr_block =  "${var.vpc_fullcidr}"
        from_port = 0
        to_port = 0
    }
    ingress {
        protocol = "-1"
        rule_no = 1
        action = "allow"
        cidr_block =  "${var.vpc_fullcidr}"
        from_port = 0
        to_port = 0
    }
    tags {
        Name = "public-nacl"
    }
}

resource "aws_network_acl_rule" "public_ssh_in" {
  network_acl_id = "${aws_network_acl.public.id}"
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "${var.source-cidr}"
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "public_ephemeral_in" {
  network_acl_id = "${aws_network_acl.public.id}"
  rule_number    = 220
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}

resource "aws_network_acl_rule" "public_web_http" {
  network_acl_id = "${aws_network_acl.public.id}"
  rule_number    = 240
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.2.0/24"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "public_rds_http" {
  network_acl_id = "${aws_network_acl.public.id}"
  rule_number    = 260
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.3.0/24"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "public_web_https" {
  network_acl_id = "${aws_network_acl.public.id}"
  rule_number    = 280
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.2.0/24"
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "public_rds_https" {
  network_acl_id = "${aws_network_acl.public.id}"
  rule_number    = 300
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.3.0/24"
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "public_ssh_out" {
  network_acl_id = "${aws_network_acl.public.id}"
  rule_number    = 200
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "${var.vpc_fullcidr}"
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "public_ephemeral_out" {
  network_acl_id = "${aws_network_acl.public.id}"
  rule_number    = 220
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}

resource "aws_network_acl_rule" "public_http_out" {
  network_acl_id = "${aws_network_acl.public.id}"
  rule_number    = 240
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "public_https_out" {
  network_acl_id = "${aws_network_acl.public.id}"
  rule_number    = 260
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

#====================================
# Private Webapp NACL and Rules
#====================================
resource "aws_network_acl" "private-web" {
   vpc_id = "${aws_vpc.esn-vpc.id}"
    egress {
        protocol = "-1"
        rule_no = 2
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    ingress {
        protocol = "-1"
        rule_no = 1
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    tags {
        Name = "webapp-nacl"
    }
}

resource "aws_network_acl_rule" "web_ssh_in" {
  network_acl_id = "${aws_network_acl.private-web.id}"
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.1.0/24"
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "web_ephemeral_in" {
  network_acl_id = "${aws_network_acl.private-web.id}"
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}

resource "aws_network_acl_rule" "web_ephemeral_out" {
  network_acl_id = "${aws_network_acl.private-web.id}"
  rule_number    = 100
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.1.0/24"
  from_port      = 1024
  to_port        = 65535
}

resource "aws_network_acl_rule" "web_http_out" {
  network_acl_id = "${aws_network_acl.private-web.id}"
  rule_number    = 200
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "web_https_out" {
  network_acl_id = "${aws_network_acl.private-web.id}"
  rule_number    = 220
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

#======================================
# Private RDS NACL and Rules
#======================================
resource "aws_network_acl" "private-rds" {
   vpc_id = "${aws_vpc.esn-vpc.id}"
    egress {
        protocol = "-1"
        rule_no = 2
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    ingress {
        protocol = "-1"
        rule_no = 1
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    tags {
        Name = "rds-nacl"
    }
}

resource "aws_network_acl_rule" "rds_ssh_in" {
  network_acl_id = "${aws_network_acl.private-rds.id}"
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.1.0/24"
  from_port      = 22
  to_port        = 22
}

resource "aws_network_acl_rule" "rds_ephemeral_in" {
  network_acl_id = "${aws_network_acl.private-rds.id}"
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}

resource "aws_network_acl_rule" "rds_ephemeral_out" {
  network_acl_id = "${aws_network_acl.private-rds.id}"
  rule_number    = 100
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.1.0/24"
  from_port      = 1024
  to_port        = 65535
}

resource "aws_network_acl_rule" "rds_http_out" {
  network_acl_id = "${aws_network_acl.private-rds.id}"
  rule_number    = 200
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "rds_https_out" {
  network_acl_id = "${aws_network_acl.private-rds.id}"
  rule_number    = 220
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}
