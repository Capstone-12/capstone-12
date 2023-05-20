resource "aws_instance" "nat_instance" {
  ami = var.nat_ami_id
  instance_type = "t3.small"
  key_name = "new-keypair"
  subnet_id = aws_subnet.public_subnet.id
  source_dest_check = false
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.nat_sec_grp.id]
  tags = {
    Name = "nat-instance"
  }
}

resource "aws_launch_template" "node_launch_template" {
  name_prefix = "node-launch-template"
  image_id = "ami-05e8e219ac7e82eba"
  instance_type = "t3.small"
  key_name = "new-keypair"
  vpc_security_group_ids = [aws_security_group.nodes_sg.id]
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "node-instance"
    }
  }
}

resource "aws_autoscaling_group" "node_asg" {
  name = "node-asg"
  max_size = 4
  min_size = 1
  desired_capacity = 2
  launch_template {
    id = aws_launch_template.node_launch_template.id
    version = "$Latest"
  }
  vpc_zone_identifier = [aws_subnet.private_subnet1.id, aws_subnet.private_subnet2.id]
}
