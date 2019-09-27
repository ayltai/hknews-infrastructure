resource "aws_instance" "hknews" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.hknews.id
  key_name      = aws_key_pair.hknews.key_name

  vpc_security_group_ids = [
    aws_security_group.hknews.id,
  ]

  root_block_device {
    volume_size = var.storage_size
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt -qq install python -y",
    ]

    connection {
      host        = aws_instance.hknews.public_ip
      private_key = file(var.private_key)
      user        = var.user
    }
  }

  provisioner "local-exec" {
    command = <<EOT
      sleep 50;
      >inventory.ini;
      echo "[hknews]" | tee -a inventory.ini;
      echo "${aws_eip.hknews.public_ip} ansible_user=${var.user} ansible_ssh_private_key_file=${var.private_key}" | tee -a inventory.ini;
      export ANSIBLE_HOST_KEY_CHECKING=False;
      ansible-playbook -u ${var.user} --private-key ${var.private_key} --vault-password-file ${var.vault_password_file} -i inventory.ini ../ansible/playbook.yml
    EOT
  }

  tags = {
    Name = var.tag
  }
}
