resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = merge(var.tags, {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    Name                                        = "${var.name_prefix_project}-vpc",
  })
}