variable "cluster_name" {
  type = string
}

variable "name_prefix_project" {
  type = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type = string
}

variable "tags" {
  type = map(string)
}

variable "availability_zones_count" {
  description = "The number of AZs."
  type        = number
}

variable "subnet_cidr_bits" {
  description = "The number of subnet bits for the CIDR. For example, specifying a value 8 for this parameter will create a CIDR with a mask of /24."
  type        = number
}