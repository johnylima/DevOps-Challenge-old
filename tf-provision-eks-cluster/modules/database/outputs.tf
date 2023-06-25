output "instance_connection_info_RDS" {
  description = "Object containing connection info RDS"
  value = {
    endpoint        = aws_rds_cluster.this.endpoint
    id              = aws_rds_cluster.this.id
    port            = aws_rds_cluster.this.port
    master_username = aws_rds_cluster.this.master_username
  }
}

