resource "aws_db_subnet_group" "prashansa_db_subnet_group" {
  name       = "prashansa_db_subnet_groups"
  subnet_ids = [var.database_subnet_1_id, var.database_subnet_2_id]

  tags = {
    Name        = "prashansa DB subnet group"
    silo        = "intern2"
    owner       = "prashansa.joshi"
    terraform   = "true"
    environment = "dev"
  }
}

resource "aws_db_instance" "prashansa_private_db_instance" {
  allocated_storage      = 10
  db_name                = var.database_name  #testdb
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
  multi_az               = true
  db_subnet_group_name   = aws_db_subnet_group.prashansa_db_subnet_group.name
  vpc_security_group_ids = [var.db_security_group_id]

  tags = {
    Name        = "prashansa DB"
    silo        = "intern2"
    owner       = "prashansa.joshi"
    terraform   = "true"
    environment = "dev"
  }
}
