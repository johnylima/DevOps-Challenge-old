# AWS #

variable "aws_account_id" {
  type = string
}

variable "aws_region" {
  description = "Region for AWS Resources"
  type        = string
  default     = "eu-west-3"
}


# IDENTIFICATION #
variable "naming_prefix" {
  type        = string
  description = "Naming prefix for resources"
  default     = "EU"
}

variable "naming_prefix_project" {
  type        = string
  description = "Full identification"
}

variable "company" {
  type        = string
  description = "Company name for resource tagging"
  default     = "Jumia"
}

variable "environment" {
  type        = string
  description = "Application environment for deployment"
  default     = "Development"
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "application" {
  type        = string
  description = "Application name"
}

variable "billing_code" {
  type        = string
  description = "Billing code for resource tagging"
}