#Key Pair for Hunterist Production
resource "aws_key_pair" "hunterist-prod-front01" {
  key_name   = "hunterist-prod-front01"
  public_key = "YOUR PUBLIC KEY"
}

resource "aws_key_pair" "hunterist-prod-front02" {
  key_name   = "hunterist-prod-front02"
  public_key = "YOUR PUBLIC KEY"
}

resource "aws_key_pair" "hunterist-prod-pipeline01" {
  key_name   = "hunterist-prod-pipeline01"
  public_key = "YOUR PUBLIC KEY"
}

resource "aws_key_pair" "hunterist-prod-pipeline02" {
  key_name   = "hunterist-prod-pipeline02"
  public_key = "YOUR PUBLIC KEY"
}
