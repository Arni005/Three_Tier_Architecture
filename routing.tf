resource "aws_route_table" "publicRT"{
 vpc_id =  aws_vpc.myvpc.id  
 route{
   cidr_block = "0.0.0.0/0" 
   gateway_id = aws_internet_gateway.igw.id
 }  
}

resource "aws_route_table" "privateRT" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.web_ng.id
  }
}

resource "aws_route_table_association" "rta1"{
    subnet_id = aws_subnet.public_1.id
    route_table_id = aws_route_table.publicRT.id
}

resource "aws_route_table_association" "rta2"{
    subnet_id = aws_subnet.public_2.id
    route_table_id = aws_route_table.publicRT.id
}

resource "aws_route_table_association" "rta3"{
    subnet_id = aws_subnet.private_app_1.id
    route_table_id = aws_route_table.privateRT.id
}

resource "aws_route_table_association" "rta4"{
    subnet_id = aws_subnet.private_app_2.id
    route_table_id = aws_route_table.privateRT.id
}

resource "aws_route_table_association" "rta5"{
    subnet_id = aws_subnet.private_db_1.id
    route_table_id = aws_route_table.privateRT.id
}

resource "aws_route_table_association" "rta6"{
    subnet_id = aws_subnet.private_db_2.id
    route_table_id = aws_route_table.privateRT.id
}
