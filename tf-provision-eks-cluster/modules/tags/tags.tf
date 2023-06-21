locals {
  tags = {
    Company       = var.company
    Project       = var.project
    BillingCode   = var.billing_code
    Environment   = var.environment
    ProvisionedBy = "terraform"
  }
}

output "tags" {
  description = "combined map of required and optional tags"
  value       = merge(local.tags, var.additional_tags)
}