##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  region = var.aws_region
  
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

##################################################################################
# TERRAFORM CONFIGURATION
##################################################################################

terraform {
  required_version = "~> 1.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.47.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }
  }
}