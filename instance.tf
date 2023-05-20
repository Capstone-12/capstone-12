#Create aws key pair 
resource "aws_key_pair" "mykeypair"{
  key_name   = "basil"
  public_key = file("/home/vagrant/.ssh/id_rsa.pub")

}

#Create Aws instance 
resource "aws_instance" "master"{
  ami           = "ami-0261755bbcb8c4a84"
  instance_type = "t2.medium"
  key_name       = "basil"
  associate_public_ip_address = true
  subnet_id      = aws_subnet.public-1-subnet.id
  vpc_security_group_ids      = [aws_security_group.master-sg.id]
tags = {
    Name = "Master"
  }
connection {
  type        = "ssh"
  user        = "ubuntu"
  private_key = file("/home/vagrant/.ssh/id_rsa")
  host        = self.public_ip
}

}


resource "aws_instance" "worker-node"{
  ami           = "ami-0261755bbcb8c4a84"
  instance_type = "t2.medium"
  key_name       = "basil"
  associate_public_ip_address = true
  subnet_id      = aws_subnet.public-1-subnet.id
  vpc_security_group_ids      = [aws_security_group.worker-sg.id]
tags = {
    Name = "worker"
  }
connection {
  type        = "ssh"
  user        = "ubuntu"
  private_key = file("/home/vagrant/.ssh/id_rsa")
  host        = self.public_ip
}

}


resource "null_resource" "save_ip" {
  depends_on = [ aws_instance.master, aws_instance.worker-node ]

  provisioner "local-exec" {
    command = "echo '[server1]' >> host-inventory && echo '${aws_instance.master.public_ip}' ansible_user=ubuntu >> host-inventory"
  }
  
   provisioner "local-exec" {
    command = "echo '[server2]' >> host-inventory && echo '${aws_instance.worker-node.public_ip}' ansible_user=ubuntu >> host-inventory"
  }

}

resource "null_resource" "ansible" {
depends_on = [null_resource.save_ip]

provisioner "local-exec" {
  command = "ANSIBLE_HOST_KEY_CHECKING=False  ansible-playbook -i /home/vagrant/capstone/host-inventory  /home/vagrant/capstone/play.yaml"
 }
}
