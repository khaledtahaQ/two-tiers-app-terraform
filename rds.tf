resource "aws_db_instance" "db" {
  identifier = "db"
  # storage in gb
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "16.4"
  instance_class       = "db.t3.micro"
  username             = "ahl"
  enabled_cloudwatch_logs_exports =  ["postgresql"]
  password             = var.db_password
  publicly_accessible  = false
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name = aws_db_subnet_group.db_subnet.name
}

# creating RDS DB subnet group resource
resource "aws_db_subnet_group" "db_subnet" {
  name       = "db-subnet-group"
  subnet_ids = module.vpc.private_subnets
}