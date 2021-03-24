resource "aws_instance" "k3s" {
  ami             = "ami-0f1026b68319bad6c"
  instance_type   = "t2.micro"
  key_name        = var.key
  security_groups = [aws_security_group.allow_ssh.id, aws_security_group.allow_http.id]

  private_ip = var.private_ip_instance
  subnet_id  = aws_subnet.k3s_subnet.id
}

resource "aws_eip" "elastic_ip_k3s" {
  vpc = true

  instance                  = aws_instance.k3s.id
  associate_with_private_ip = var.private_ip_instance
  depends_on                = [aws_internet_gateway.kubernetes_gateway]
}