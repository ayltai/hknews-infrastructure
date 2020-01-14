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

  tags = {
    Name = var.tag
  }
}

resource "null_resource" "exec" {
  triggers = {
    aws_eip_id = aws_eip.hknews.id,
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt -qq install python3 -y",
    ]

    connection {
      agent       = false
      timeout     = var.timeout
      host        = aws_eip.hknews.public_ip
      private_key = file(var.private_key)
      user        = var.username
    }
  }

  provisioner "local-exec" {
    command = <<EOT
      sleep 50;
      >inventory.ini;
      echo "[hknews]" | tee -a inventory.ini;
      echo "${aws_eip.hknews.public_ip} ansible_user=${var.username} ansible_ssh_private_key_file=${var.private_key}" | tee -a inventory.ini;
      export ANSIBLE_HOST_KEY_CHECKING=False;
      ansible-playbook -u ${var.username} --private-key ${var.private_key} --vault-password-file ${var.vault_password_file} -i inventory.ini ../ansible/playbook.yml
    EOT
  }
}
