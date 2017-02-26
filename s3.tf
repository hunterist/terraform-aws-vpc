#S3 Bucket for Hunterist Production
resource "aws_s3_bucket" "hunterist-prod-s3" {
  bucket = "hunterist-prod"
  acl    = "private"

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
    expose_headers = ["*"]
    max_age_seconds = 3000
  }

  tags {
    Name        = "Hunterist-Prod-S3"
    Project     = "Hunterist"
    Environment = "Production"
  }
}
