resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = aws_vpc.kubernetes.id

  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "SSH"
    from_port        = 22
    ipv6_cidr_blocks = null
    prefix_list_ids  = null
    protocol         = "tcp"
    security_groups  = null
    self             = false
    to_port          = 22
  }]
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = null
    from_port        = 0
    ipv6_cidr_blocks = null
    prefix_list_ids  = null
    protocol         = "-1"
    security_groups  = null
    self             = false
    to_port          = 0
  }]
}

resource "aws_internet_gateway" "kubernetes_gateway" {
  vpc_id = aws_vpc.kubernetes.id
}

resource "aws_route_table" "k3s_table" {
  vpc_id = aws_vpc.kubernetes.id

  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.kubernetes_gateway.id
  }
}

resource "aws_route_table_association" "k3s_association_table" {
  subnet_id      = aws_subnet.k3s_subnet.id
  route_table_id = aws_route_table.k3s_table.id
}