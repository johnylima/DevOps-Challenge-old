############################### INTERNET GATEWAY #################

resource "aws_internet_gateway" "this" {
  vpc_id     = aws_vpc.this.id
  depends_on = [aws_vpc.this]
  tags = merge(var.tags, {
    "Name" = "${var.name_prefix_project}-igw"
  })
}

############################### ROUTE TABLE(s) ##################

# Route the public subnet traffic through the IGW
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
  tags = merge(var.tags, {
    Name = "${var.name_prefix_project}-Default-rt"
  })
}

# Route table and subnet associations
resource "aws_route_table_association" "internet_access" {
  count          = var.availability_zones_count
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.main.id
}

############################### NAT ###########################

# NAT Elastic IP
resource "aws_eip" "main" {
  vpc = true
  tags = merge(var.tags, {
    Name = "${var.name_prefix_project}-ngw-ip"
  })
}

# NAT Gateway
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.main.id
  subnet_id     = aws_subnet.public[0].id
  tags = merge(var.tags, {
    Name = "${var.name_prefix_project}-ngw"
  })
}

# Add route to route table
resource "aws_route" "main" {
  route_table_id         = aws_vpc.this.default_route_table_id
  nat_gateway_id         = aws_nat_gateway.main.id
  destination_cidr_block = "0.0.0.0/0"
}