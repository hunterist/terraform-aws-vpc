output "account-id" {
  value = "${data.aws_caller_identity.self.account_id}"
}

output "hunterist-prod-endpoint" {
  value = "${aws_db_instance.hunterist-prod-rds.endpoint}"
}
