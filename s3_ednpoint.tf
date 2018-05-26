resource "aws_vpc_endpoint" "private-s3" {
    vpc_id = "${aws_vpc.esn-vpc.id}"
    service_name = "com.amazonaws.us-east-1.s3"
    route_table_ids = ["${aws_route_table.private.id}"]
    policy = <<POLICY
{
    "Statement": [
        {
            "Action": "*",
            "Effect": "Allow",
            "Resource": "*",
            "Principal": "*"
        }
    ]
}
POLICY
}
