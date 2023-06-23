##################################################################################
# OUTPUT
##################################################################################

output "region" {
  description = "AWS region"
  value       = var.aws_region
}
output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.endpoint
}
output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}
output "cluster_ca_certificate" {
  value = module.eks.cluster_ca_certificate
}

output "endpoint" {
  value = module.database.endpoint
}

output "port" {
  value = module.database.port
}

output "database_name" {
  value = module.database.database_name
}

output "master_username" {
  value = module.database.master_username
}
