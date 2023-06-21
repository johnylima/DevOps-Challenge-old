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