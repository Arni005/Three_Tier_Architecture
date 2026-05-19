resource "aws_db_subnet_group" "db_subnet" {
  name = "db-subnet-group"

  subnet_ids = [
    aws_subnet.private_db_1.id,
    aws_subnet.private_db_2.id
  ]
}



resource "aws_db_instance" "mydb" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
   publicly_accessible = false
  db_name  = "myappdb"
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]

  skip_final_snapshot = true
}