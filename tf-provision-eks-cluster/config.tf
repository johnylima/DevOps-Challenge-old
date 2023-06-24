##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  /*
   assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id}:role/CICDProvisioner"
  }
  */
}

##################################################################################
# TERRAFORM REMOTE BACKEND
##################################################################################

terraform {
  /*
  backend "s3" {
    bucket         = "tfstate-jumia-jlhexa"
    dynamodb_table = "tfstate-jumia-jlhexa"
    region         = "eu-west-3"
    key            = "main.tfstate"
    profile        = "default"
    encrypt        = true
  }
  */
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "tfstate-jumia-jlhexa"
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_state" {
  name           = "tfstate-jumia-jlhexa"
  hash_key       = "LockID"
  read_capacity  = 1
  write_capacity = 1
  attribute {
    name = "LockID"
    type = "S"
  }
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