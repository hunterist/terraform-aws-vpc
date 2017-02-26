#VPC Public Route Table for Hunterist Production
resource "aws_route_table" "hunterist-prod-public" {
  vpc_id = "${aws_vpc.hunterist-prod.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.hunterist-prod.id}"
  }

  tags {
    Name        = "Hunterist-Prod-Public-RT"
    Project     = "Hunterist"
    Environment = "Production"
  }
}



#Network ACL for Hunterist Production
resource "aws_network_acl" "hunterist-prod-public" {
  vpc_id     = "${aws_vpc.hunterist-prod.id}"
  subnet_ids = ["${aws_subnet.hunterist-prod-front01.id}", "${aws_subnet.hunterist-prod-front02.id}", 
  "${aws_subnet.hunterist-prod-rds01.id}", "${aws_subnet.hunterist-prod-rds01.id}", 
  "${aws_subnet.hunterist-prod-pipeline01.id}", "${aws_subnet.hunterist-prod-pipeline02.id}"]

  tags {
    Name        = "Hunterist-Prod-Public-NACL"
    Project     = "Hunterist"
    Environment = "Production"
  }

  #Inbound Traffic
  ingress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }
  
  ingress {
    rule_no    = 200
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }
  ingress {
    rule_no    = 300
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.201.0.0/16"
    from_port  = 5432
    to_port    = 5432
  }
  ingress {
    rule_no    = 1000
    protocol   = "icmp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    icmp_type  = -1
    icmp_code  = -1
  }
  ingress {
    rule_no    = 1100
    protocol   = "udp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 123
    to_port    = 123
  }
  ingress {
    rule_no    = 1200
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }
  ingress {
    rule_no    = 9000
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  #Outbound Traffic
  egress {
    rule_no    = 100
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }
  egress {
    rule_no    = 200
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }
  egress {
    rule_no    = 300
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }
  egress {
    rule_no    = 400
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "10.201.0.0/16"
    from_port  = 5432
    to_port    = 5432
  }
  egress {
    rule_no    = 1000
    protocol   = "icmp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
    icmp_type  = -1
    icmp_code  = -1
  }
  egress {
    rule_no    = 1100
    protocol   = "udp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 123
    to_port    = 123
  }
  egress {
    rule_no    = 1200
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }
  egress {
    rule_no    = 1300
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 10
    to_port    = 10
  }
  egress {
    rule_no    = 1400
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 25
    to_port    = 25
  }
  egress {
    rule_no    = 1500
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 587
    to_port    = 587
  }
  egress {
    rule_no    = 1600
    protocol   = "tcp"
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 465
    to_port    = 465
  }

}