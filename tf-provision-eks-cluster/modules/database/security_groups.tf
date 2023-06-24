resource "aws_security_group" "this" {
  name   = "${var.name_prefix_project}-databases-sg"
  tags   = var.tags
  vpc_id = var.vpc_id
  ingress {
    from_port   = 1337
    to_port     = 1337
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    //cidr_blocks = ["10.0.0.0/16"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    //cidr_blocks = ["10.0.0.0/16"]
  }
}