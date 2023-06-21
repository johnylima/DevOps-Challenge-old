variable "company" {
  type = string
}

variable "project" {
  type = string
}

variable "billing_code" {
  type = string
}

variable "additional_tags" {
  description = "map of optional tags to consolidate with the required tags"
  type        = map(string)
  default     = {}
}

variable "environment" {
  type = string
}