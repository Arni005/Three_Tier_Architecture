resource "aws_subnet" "public_1"{
 vpc_id = aws_vpc.myvpc.id
 cidr_block = "10.0.0.0/24"
 availability_zone = "us-east-1a"
 map_public_ip_on_launch = true
}

resource "aws_subnet" "public_2"{
 vpc_id =  aws_vpc.myvpc.id
 cidr_block = "10.0.1.0/24"
 availability_zone = "us-east-1b"
 map_public_ip_on_launch = true
}

resource "aws_subnet" "private_app_1"{
 vpc_id =  aws_vpc.myvpc.id
 cidr_block = "10.0.2.0/24"
 availability_zone = "us-east-1a"
 map_public_ip_on_launch = false
}

resource "aws_subnet" "private_app_2"{
 vpc_id =  aws_vpc.myvpc.id
 cidr_block = "10.0.3.0/24"
 availability_zone = "us-east-1b"
 map_public_ip_on_launch = false
}

resource "aws_subnet" "private_db_1"{
 vpc_id =  aws_vpc.myvpc.id
 cidr_block = "10.0.4.0/24"
 availability_zone = "us-east-1a"
 map_public_ip_on_launch = false
}

resource "aws_subnet" "private_db_2"{
 vpc_id =  aws_vpc.myvpc.id
 cidr_block = "10.0.5.0/24"
 availability_zone = "us-east-1b"
 map_public_ip_on_launch = false
}