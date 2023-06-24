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
  description = "Cluster ca certificate"
  value       = module.eks.cluster_ca_certificate
}

output "instance_connection_info_RDS" {
  description = "Object containing connection info RDS"
  value       = module.database.instance_connection_info_RDS
}
