#VPC for Hunterist Production
resource "aws_vpc" "hunterist-prod" {
  cidr_block           = "10.201.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name        = "Hunterist-Prod-VPC"
    Project     = "Hunterist"
    Environment = "Production"
  }
}

#Internet Gateway for Hunterist Production
resource "aws_internet_gateway" "hunterist-prod" {
  vpc_id = "${aws_vpc.hunterist-prod.id}"

  tags {
    Name        = "Hunterist-Igw-Prod-VPC"
    Project     = "Hunterist"
    Environment = "Production"
  }
}

#VPC Subnet for Hunterist Production
resource "aws_subnet" "hunterist-prod-front01" {
  vpc_id                  = "${aws_vpc.hunterist-prod.id}"
  availability_zone       = "ap-northeast-1a"
  cidr_block              = "10.201.0.0/24"
  map_public_ip_on_launch = false

  tags {
    Name        = "Hunterist-Prod-Front01"
    Project     = "Hunterist"
    Environment = "Production"
  }
}

resource "aws_subnet" "hunterist-prod-front02" {
  vpc_id                  = "${aws_vpc.hunterist-prod.id}"
  availability_zone       = "ap-northeast-1c"
  cidr_block              = "10.201.1.0/24"
  map_public_ip_on_launch = false

  tags {
    Name        = "Hunterist-Prod-Front02"
    Project     = "Hunterist"
    Environment = "Production"
  }
}

resource "aws_subnet" "hunterist-prod-rds01" {
  vpc_id                  = "${aws_vpc.hunterist-prod.id}"
  availability_zone       = "ap-northeast-1a"
  cidr_block              = "10.201.2.0/24"
  map_public_ip_on_launch = false

  tags {
    Name        = "Hunterist-Prod-RDS01"
    Project     = "Hunterist"
    Environment = "Production"
  }
}

resource "aws_subnet" "hunterist-prod-rds02" {
  vpc_id                  = "${aws_vpc.hunterist-prod.id}"
  availability_zone       = "ap-northeast-1c"
  cidr_block              = "10.201.3.0/24"
  map_public_ip_on_launch = false

  tags {
    Name        = "Hunterist-Prod-RDS02"
    Project     = "Hunterist"
    Environment = "Production"
  }
}

resource "aws_subnet" "hunterist-prod-pipeline01" {
  vpc_id                  = "${aws_vpc.hunterist-prod.id}"
  availability_zone       = "ap-northeast-1a"
  cidr_block              = "10.201.4.0/24"
  map_public_ip_on_launch = false

  tags {
    Name        = "Hunterist-Prod-Pipeline01"
    Project     = "Hunterist"
    Environment = "Production"
  }
}

resource "aws_subnet" "hunterist-prod-pipeline02" {
  vpc_id                  = "${aws_vpc.hunterist-prod.id}"
  availability_zone       = "ap-northeast-1c"
  cidr_block              = "10.201.5.0/24"
  map_public_ip_on_launch = false

  tags {
    Name        = "Hunterist-Prod-Pipeline02"
    Project     = "Hunterist"
    Environment = "Production"
  }
}
