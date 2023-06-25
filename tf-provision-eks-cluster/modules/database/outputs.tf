output "connection_info_RDS" {
  description = "Object containing connection info RDS"
  value = {
    id              = aws_rds_cluster.this.id
    endpoint        = aws_rds_cluster.this.endpoint
    port            = aws_rds_cluster.this.port
    master_username = aws_rds_cluster.this.master_username
  }
}

output "master_password" {
  value       = aws_rds_cluster.this.master_password
  sensitive = true
}

