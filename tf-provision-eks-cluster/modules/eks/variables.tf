variable "cluster_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "name_prefix_project" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "instance_types" {
  type        = list(string)
  description = "Type for Cluster Instance"
}