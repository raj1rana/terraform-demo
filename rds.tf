# this file is for RDS and its cluster
resource "aws_db_subnet_group" "theo-aws-db-subnet-group" {
  subnet_ids = [aws_subnet.theo-public-subnet-1.id, aws_subnet.theo-public-subnet-2.id, aws_subnet.theo-public-subnet-3.id]
}
resource "aws_rds_cluster" "theo-db" {
  cluster_identifier      = "theo-cluster"
  availability_zones      = ["us-east-1a", "us-east-1b", "us-east-1c"]
  database_name           = var.theo_db_user
  master_username         = var.rds_db_user_master
  master_password         = var.rds_db_pass_master
  backup_retention_period = var.rds_backup_retention_period
  preferred_backup_window = var.rds_backup_window
  vpc_security_group_ids = [aws_security_group.theo-security-group-ec-2-connection.id]
  db_subnet_group_name = aws_db_subnet_group.theo-aws-db-subnet-group.id
}

resource "aws_rds_cluster_instance" "theo-db-instance" {
  cluster_identifier = aws_rds_cluster.theo-db.id
  instance_class = var.rds_instance_class
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.03.2"
}