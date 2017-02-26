#EC2 Instance for Hunterist Production
resource "aws_instance" "hunterist-prod-front01" {
  ami                     = "ami-46ee3127"
  availability_zone       = "ap-northeast-1a"
  instance_type           = "m3.medium"
  source_dest_check       = false
  ebs_optimized           = false
  key_name                = "${aws_key_pair.hunterist-prod-front01.key_name}"
  subnet_id               = "${aws_subnet.hunterist-prod-front01.id}"
  disable_api_termination = false

  vpc_security_group_ids = [
    "${aws_security_group.hunterist-prod-front.id}",
  ]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "20"
    delete_on_termination = true
  }

  tags {
    Name        = "Hunterist-Prod-Front01"
    Project     = "Hunterist"
    Environment = "Production"
  }
}

resource "aws_instance" "hunterist-prod-front02" {
  ami                     = "ami-46ee3127"
  availability_zone       = "ap-northeast-1c"
  instance_type           = "m3.medium"
  source_dest_check       = false
  ebs_optimized           = false
  key_name                = "${aws_key_pair.hunterist-prod-front02.key_name}"
  subnet_id               = "${aws_subnet.hunterist-prod-front02.id}"
  disable_api_termination = false

  vpc_security_group_ids = [
    "${aws_security_group.hunterist-prod-front.id}",
  ]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "20"
    delete_on_termination = true
  }

  tags {
    Name        = "Hunterist-Prod-Front02"
    Project     = "Hunterist"
    Environment = "Production"
  }
}

resource "aws_instance" "hunterist-prod-pipeline01" {
  ami                     = "ami-2df02f4c"
  availability_zone       = "ap-northeast-1a"
  instance_type           = "c4.xlarge"
  source_dest_check       = false
  ebs_optimized           = true
  key_name                = "${aws_key_pair.hunterist-prod-pipeline01.key_name}"
  subnet_id               = "${aws_subnet.hunterist-prod-pipeline01.id}"
  disable_api_termination = false

  vpc_security_group_ids = [
    "${aws_security_group.hunterist-prod-pipeline.id}",
  ]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "100"
    delete_on_termination = true
  }

  tags {
    Name        = "Hunterist-Prod-Pipeline01"
    Project     = "Hunterist"
    Environment = "Production"
  }
}

resource "aws_instance" "hunterist-prod-pipeline02" {
  ami                     = "ami-2df02f4c"
  availability_zone       = "ap-northeast-1c"
  instance_type           = "c4.xlarge"
  source_dest_check       = false
  ebs_optimized           = true
  key_name                = "${aws_key_pair.hunterist-prod-pipeline02.key_name}"
  subnet_id               = "${aws_subnet.hunterist-prod-pipeline02.id}"
  disable_api_termination = false

  vpc_security_group_ids = [
    "${aws_security_group.hunterist-prod-pipeline.id}",
  ]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "100"
    delete_on_termination = true
  }

  tags {
    Name        = "Hunterist-Prod-Pipeline02"
    Project     = "Hunterist"
    Environment = "Production"
  }
}