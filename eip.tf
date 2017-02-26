#EIP for Hunterist Production
resource "aws_eip" "hunterist-prod-front01" {
  instance = "${aws_instance.hunterist-prod-front01.id}"
  vpc      = true
}

resource "aws_eip" "hunterist-prod-front02" {
  instance = "${aws_instance.hunterist-prod-front02.id}"
  vpc      = true
}

resource "aws_eip" "hunterist-prod-pipeline01" {
  instance = "${aws_instance.hunterist-prod-pipeline01.id}"
  vpc      = true
}

resource "aws_eip" "hunterist-prod-pipeline02" {
  instance = "${aws_instance.hunterist-prod-pipeline02.id}"
  vpc      = true
}
