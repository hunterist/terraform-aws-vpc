#Security Group for Hunterist Production (Front Server)
resource "aws_security_group" "hunterist-prod-front" {
  vpc_id      = "${aws_vpc.hunterist-prod.id}"
  name        = "Hunterist-Prod-Front-SG"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.201.0.0/16"]
  }

  egress {
    from_port   = 10
    to_port     = 10
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 25
    to_port     = 25
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 587
    to_port     = 587
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 465
    to_port     = 465
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "Hunterist-Prod-Front-SG"
    Project     = "Hunterist"
    Environment = "Production"
  }
}

#Security Group for Hunterist Production (RDS Server)
resource "aws_security_group" "hunterist-prod-rds" {
  vpc_id      = "${aws_vpc.hunterist-prod.id}"
  name        = "Hunterist-Prod-RDS-SG"

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["10.201.0.0/16"]
  }

  tags {
    Name        = "Hunterist-Prod-RDS-SG"
    Project     = "Hunterist"
    Environment = "Production"
  }
}

#Security Group for Hunterist Production (Pipeline Server)
resource "aws_security_group" "hunterist-prod-pipeline" {
  vpc_id      = "${aws_vpc.hunterist-prod.id}"
  name        = "Hunterist-Prod-Pipeline-SG"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "Hunterist-Prod-Pipeline-SG"
    Project     = "Hunterist"
    Environment = "Production"
  }
}

#Security Group for Hunterist Production (Front Server)
resource "aws_security_group" "hunterist-prod-frontelb" {
  vpc_id      = "${aws_vpc.hunterist-prod.id}"
  name        = "Hunterist-Prod-Front-ELB"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "Hunterist-Prod-Front-ELB"
    Project     = "Hunterist"
    Environment = "Production"
  }
}