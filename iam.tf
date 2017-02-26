# IAM User for Hunterist Production
resource "aws_iam_user" "hunterist-prod" {
  name          = "hunterist-prod"
  path          = "/"
  force_destroy = false
}

resource "aws_iam_policy" "hunterist-prod" {
  name        = "Hunterist-Prod-Policy"
  path        = "/"
  description = "Access policy for Hunterist Production"
  policy      = "${file("policies/iam_policy_hunterist_prod.json")}"
}

resource "aws_iam_user_policy_attachment" "hunterist-prod" {
  user       = "${aws_iam_user.hunterist-prod.name}"
  policy_arn = "${aws_iam_policy.hunterist-prod.arn}"
}
