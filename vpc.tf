resource "aws_vpc" "myvpc"{
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support   = true
    enable_dns_hostnames = true
}

resource "aws_internet_gateway" "igw" {
 vpc_id =  aws_vpc.myvpc.id
}

resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "web-server-ng-eip"
  }
}

resource "aws_nat_gateway" "web_ng" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "Web-Server-NG"
  }

  depends_on = [aws_internet_gateway.igw]
}





