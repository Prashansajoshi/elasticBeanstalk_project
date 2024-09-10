#elastic_ip 
resource "aws_eip" "eip_prashansa" {
  domain = "vpc"
  tags = {
    Name = "eip_prashansa"
  }
}

#nat
resource "aws_nat_gateway" "prashansa_nat" {
  allocation_id = aws_eip.eip_prashansa.id
  subnet_id     = var.public_subnet_id
  tags = {
    Name = "prashansa_nat"
  }
}
