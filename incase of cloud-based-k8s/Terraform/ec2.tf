#Create aws key pair 
resource "aws_key_pair" "mykeypair"{
  key_name   = "capstone1"
  public_key = file("/home/saluteslim/.ssh/id_rsa.pub")

}

#Create master node 
resource "aws_instance" "master"{
  ami           = "ami-0136ddddd07f0584f"
  instance_type = "t2.medium"
  key_name       = "capstone1"
  associate_public_ip_address = true
  subnet_id      = aws_subnet.public-1-subnet.id
  vpc_security_group_ids      = [aws_security_group.master-sg.id]
tags = {
    Name = "Master"
  }
connection {
  type        = "ssh"
  user        = "ubuntu"
  private_key = file("/home/saluteslim/.ssh/id_rsa")
  host        = self.public_ip
}

}

# Create worker node
resource "aws_instance" "worker-node"{
  ami           = "ami-0136ddddd07f0584f"
  instance_type = "t2.medium"
  key_name       = "capstone1"
  associate_public_ip_address = true
  subnet_id      = aws_subnet.public-1-subnet.id
  vpc_security_group_ids      = [aws_security_group.worker-sg.id]
tags = {
    Name = "worker"
  }
connection {
  type        = "ssh"
  user        = "ubuntu"
  private_key = file("/home/saluteslim/.ssh/id_rsa")
  host        = self.public_ip
}

}


resource "null_resource" "save_ip" {
  depends_on = [ aws_instance.master, aws_instance.worker-node ]

  provisioner "local-exec" {
    command = "echo '[master]' >> host-inventory && echo '${aws_instance.master.public_ip}' ansible_user=ubuntu >> host-inventory"
  }
  
   provisioner "local-exec" {
    command = "echo '[worker]' >> host-inventory && echo '${aws_instance.worker-node.public_ip}' ansible_user=ubuntu >> host-inventory"
  }

    provisioner "local-exec" {
    command = "echo '[master]' >> host-inventory-m && echo '${aws_instance.master.public_ip}' ansible_user=ubuntu >> host-inventory-m"
  }
  
   provisioner "local-exec" {
    command = "echo '[worker]' >> host-inventory-w && echo '${aws_instance.worker-node.public_ip}' ansible_user=ubuntu >> host-inventory-w"
  }

}

resource "null_resource" "ansible" {
depends_on = [null_resource.save_ip]

provisioner "local-exec" {
  command = "ANSIBLE_HOST_KEY_CHECKING=False  ansible-playbook -i /mnt/c/Users/teslim/Desktop/AltSchool_Cloud/capstone/capstone-12/Terraform/host-inventory  /mnt/c/Users/teslim/Desktop/AltSchool_Cloud/capstone/capstone-12/Ansible/non-root.yml"
 }
}

resource "null_resource" "ansible1" {
depends_on = [null_resource.save_ip]

provisioner "local-exec" {
  command = "ANSIBLE_HOST_KEY_CHECKING=False  ansible-playbook -i /mnt/c/Users/teslim/Desktop/AltSchool_Cloud/capstone/capstone-12/Terraform/host-inventory  /mnt/c/Users/teslim/Desktop/AltSchool_Cloud/capstone/capstone-12/Ansible/kube-dependencies.yml"
 }
}

resource "null_resource" "ansible2" {
depends_on = [null_resource.save_ip]

provisioner "local-exec" {
  command = "ANSIBLE_HOST_KEY_CHECKING=False  ansible-playbook -i /mnt/c/Users/teslim/Desktop/AltSchool_Cloud/capstone/capstone-12/Terraform/host-inventory-m  /mnt/c/Users/teslim/Desktop/AltSchool_Cloud/capstone/capstone-12/Ansible/master-node.yml"
 }
}

resource "null_resource" "ansible3" {
depends_on = [null_resource.save_ip]

provisioner "local-exec" {
  command = "ANSIBLE_HOST_KEY_CHECKING=False  ansible-playbook -i /mnt/c/Users/teslim/Desktop/AltSchool_Cloud/capstone/capstone-12/Terraform/host-inventory-w  /mnt/c/Users/teslim/Desktop/AltSchool_Cloud/capstone/capstone-12/Ansible/worker-node.yml"
 }
}