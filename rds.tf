#RDS Instance for Hunterist Production

resource "aws_db_subnet_group" "hunterist-prod-rds" {
  name        = "hunterist-subgroup"
  subnet_ids  = ["${aws_subnet.hunterist-prod-rds01.id}", "${aws_subnet.hunterist-prod-rds02.id}"]

  tags {
    Name        = "Hunterist-Prod-SubGroup"
    Project     = "Hunterist"
    Environment = "Production"
  }
}

resource "aws_db_instance" "hunterist-prod-rds" {
  allocated_storage           = 32
  engine                      = "postgres"
  engine_version              = "9.5.4"
  identifier                  = "hunterist-prod"
  instance_class              = "db.r3.large"
  storage_type                = "gp2"
  name                        = "hunterist"
  username                    = "hunterist"
  password                    = "${var.aws_rds_password}"
  final_snapshot_identifier   = "final-snapshot-hunterist-prod"
  skip_final_snapshot         = false
  copy_tags_to_snapshot       = true
  backup_retention_period     = "1"
  backup_window               = "18:00-18:30"
  maintenance_window          = "Sat:19:00-Sat:19:30"
  multi_az                    = false
  port                        = "5432"
  publicly_accessible         = false
  vpc_security_group_ids      = ["${aws_security_group.hunterist-prod-rds.id}"]
  db_subnet_group_name        = "${aws_db_subnet_group.hunterist-prod-rds.name}"
  parameter_group_name        = "${aws_db_parameter_group.hunterist-prod-rds.name}"
  storage_encrypted           = true
  apply_immediately           = false
  auto_minor_version_upgrade  = false
  allow_major_version_upgrade = false

  tags {
    Name        = "Hunterist-Prod-RDS"
    Project     = "Hunterist"
    Environment = "Production"
  }
}

resource "aws_db_instance" "hunterist-prod-rds-replica" {
  allocated_storage           = 32
  engine                      = "postgres"
  engine_version              = "9.5.4"
  identifier                  = "hunterist-prod-replica"
  replicate_source_db         = "hunterist-prod"
  instance_class              = "db.m4.large"
  storage_type                = "gp2"
  name                        = "hunterist"
  username                    = "hunterist"
  password                    = "${var.aws_rds_password}"
  multi_az                    = false
  port                        = "5432"
  publicly_accessible         = false
  vpc_security_group_ids      = ["${aws_security_group.hunterist-prod-rds.id}"]
  parameter_group_name        = "${aws_db_parameter_group.hunterist-prod-rds.name}"
  storage_encrypted           = true
  apply_immediately           = false
  auto_minor_version_upgrade  = false
  allow_major_version_upgrade = false

  tags {
    Name        = "Hunterist-Prod-RDS-Repl"
    Project     = "Hunterist"
    Environment = "Production"
  }
}

resource "aws_db_parameter_group" "hunterist-prod-rds" {
  name        = "hunterist-prod-rds"
  family      = "postgres9.5"

  parameter {
    name  = "application_name"
    value = "hunterist"
  }

  parameter {
    name  = "autovacuum_vacuum_threshold"
    value = "200"
  }

  parameter {
    name  = "lc_messages"
    value = "C"
  }

  parameter {
    name  = "log_autovacuum_min_duration"
    value = "0"
  }

  parameter {
    name  = "timezone"
    value = "Asia/Tokyo"
  }
}
