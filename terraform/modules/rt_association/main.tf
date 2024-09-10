resource "aws_route_table_association" "prashansa_association_route_table_public_1" {
  subnet_id      = var.public_subnet_1_id
  route_table_id = var.public_route_table_id
}

resource "aws_route_table_association" "prashansa_association_route_table_public_2" {
  subnet_id      = var.public_subnet_2_id
  route_table_id = var.public_route_table_id
}

resource "aws_route_table_association" "prashansa_association_route_table_private_1" {
  subnet_id      = var.private_subnet_1_id
  route_table_id = var.private_route_table_id
}

resource "aws_route_table_association" "prashansa_association_route_table_private_2" {
  subnet_id      = var.private_subnet_2_id
  route_table_id = var.private_route_table_id
}

resource "aws_route_table_association" "prashansa_association_route_table_db_1" {
  subnet_id      = var.db_subnet_1
  route_table_id = var.private_route_table_id
}

resource "aws_route_table_association" "prashansa_association_route_table_db_2" {
  subnet_id      = var.db_subnet_2
  route_table_id = var.private_route_table_id
}