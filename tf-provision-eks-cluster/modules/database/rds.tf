resource "aws_rds_cluster" "this" {
  cluster_identifier        = var.cluster_identifier
  engine                    = "aurora-postgresql"
  engine_version            = var.engine_version
  availability_zones        = var.availability_zones
  database_name             = var.database_name
  master_username           = var.master_username
  master_password           = random_password.this.result
  backup_retention_period   = 7
  preferred_backup_window   = "03:00-04:00"
  final_snapshot_identifier = "${var.cluster_identifier}-backup"
  skip_final_snapshot       = false
  deletion_protection       = false
  vpc_security_group_ids    = [aws_security_group.this.id]
  db_subnet_group_name      = aws_db_subnet_group.this.name
  tags                      = var.tags
}

resource "aws_rds_cluster_instance" "this" {
  identifier                 = var.identifier
  cluster_identifier         = aws_rds_cluster.this.id
  instance_class             = var.instance_class
  engine                     = aws_rds_cluster.this.engine
  engine_version             = aws_rds_cluster.this.engine_version
  auto_minor_version_upgrade = false
  tags                       = var.tags
}

resource "aws_db_subnet_group" "this" {
  subnet_ids = var.private_subnet_ids
  tags       = var.tags
}

resource "random_password" "this" {
  length            = 16
  special           = true
  min_special       = 5
  override_special  = "!#$%^&*()-_=+[]{}<>:?"
  keepers           = {
    pass_version  = 1
  }
}