resource "aws_instance" "bastion" {

  ami = "ami-0e735aba742568824"
  availability_zone = "ap-northeast-2a"
  instance_type = "t2.micro"
  key_name = "rapa"
  vpc_security_group_ids = [aws_security_group.test-bastion-sg.id]
  subnet_id = module.vpc.public_subnets[0]
  associate_public_ip_address = true

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("../rapa.pem")
    host = self.public_ip
  }

  provisioner "file" {
    source      = "/root/learn-terraform-provision-eks-cluster/kube_install.sh"
    destination = "/home/ubuntu/kube_install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo sh /home/ubuntu/kube_install.sh"
    ]
  }

  provisioner "file" {
    source      = "/root/learn-terraform-provision-eks-cluster/docker_install.sh"
    destination = "/home/ubuntu/docker_install.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo sh /home/ubuntu/docker_install.sh"
    ]
  }
  tags = {
      Name = "bastion"
  }
}