resource "local_file" "ssh_key" {
  content         = tls_private_key.ssh_key.private_key_openssh
  filename        = "${path.module}/ssh_key.pem"
  file_permission = "0400"
}

# Output IP Address of Admin Server
output "admin-server-private-ip" {
    description = "value of the private IP address of the admin server"
    value = aws_instance.admin-server.private_ip
}
output "admin-server-public-ip" {
    description = "value of the public IP address of the admin server"
    value = aws_eip.admin-server-eip.public_ip
}