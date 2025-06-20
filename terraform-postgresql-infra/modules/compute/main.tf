resource "aws_instance" "bastion" {
  ami                         = var.bastion_ami
  instance_type               = var.bastion_instance_type
  key_name                    = var.key_name
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.bastion_sg_id]
  associate_public_ip_address = true

  tags = {
    Name = "bastion-host"
    Role = "bastion"
  }

  provisioner "file" {
    source      = var.pem_file_path
    destination = "/home/ubuntu/apsouth.pem"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.pem_file_path)
      host        = self.public_ip
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 400 /home/ubuntu/apsouth.pem",
      "echo 'PEM file copied and permissions set on bastion!'"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.pem_file_path)
      host        = self.public_ip
    }
  }
}

resource "aws_instance" "postgresql_cluster" {
  count                       = var.instance_count
  ami                         = var.cluster_ami
  instance_type               = var.cluster_instance_type
  key_name                    = var.key_name
  subnet_id                   = element(var.private_subnet_ids, count.index)
  vpc_security_group_ids      = [var.cluster_sg_id]
  associate_public_ip_address = false

  tags = {
    Name = "pg-private-${count.index + 1}"
  }
}
