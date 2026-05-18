resource "random_password" "this" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_db_instance" "this" {
  identifier = "${var.project_name}-rds"

  allocated_storage = var.instance_storage
  instance_class    = var.instance_class
  engine            = "postgres"
  engine_version    = var.engine_version

  db_name  = var.db_name
  username = var.db_username
  password = random_password.this.result

  db_subnet_group_name = aws_db_subnet_group.this.name

  multi_az = var.multi_az

  deletion_protection = var.deletion_protection

  backup_retention_period = var.backup_retention_period
  storage_encrypted       = var.storage_encrypted
  skip_final_snapshot     = var.skip_final_snapshot

  tags = {
    Name = "${var.project_name}-rds"
  }
}
