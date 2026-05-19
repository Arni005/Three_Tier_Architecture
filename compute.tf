resource "aws_launch_template" "web_lt1" {
  name_prefix   = "web-template"
  image_id      = "ami-091138d0f0d41ff90"
  instance_type = "t2.micro"

  key_name = var.key_name
  user_data              = base64encode(file("userdata.sh"))
  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.web_sg.id]
  }
}

resource "aws_autoscaling_group" "web_asg" {
  desired_capacity = 2
  min_size         = 2
  max_size         = 4

  vpc_zone_identifier = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]

  launch_template {
    id      = aws_launch_template.web_lt1.id
    version = "$Latest"
  }
}

resource "aws_launch_template" "web_lt2" {
  name_prefix   = "web-template"
  image_id      = "ami-091138d0f0d41ff90"
  instance_type = "t2.micro"

  key_name = var.key_name
  
  network_interfaces {
    #associate_public_ip_address = true
    security_groups = [aws_security_group.web_sg.id]
  }
}

resource "aws_autoscaling_group" "app_asg" {
  desired_capacity = 2
  min_size         = 2
  max_size         = 4

  vpc_zone_identifier = [
    aws_subnet.private_app_1.id,
    aws_subnet.private_app_2.id
  ]

  launch_template {
    id      = aws_launch_template.web_lt2.id
    version = "$Latest"
  }
}
