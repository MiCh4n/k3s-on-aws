resource "aws_vpc" "kubernetes" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    "Name" = "kubernetes"
  }
}

resource "aws_subnet" "k3s_subnet" {
  vpc_id                  = aws_vpc.kubernetes.id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true

  depends_on = [aws_internet_gateway.kubernetes_gateway]
}