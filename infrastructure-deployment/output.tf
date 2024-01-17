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

# Output IP Address of S4HANA Server
output "s4hana-server-1-private-ip" {
    description = "value of the private IP address of the S4HANA server"
    value = module.sap-s4hana-1.private_ip
}
output "s4hana-server-1-public-ip" {
    description = "value of the public IP address of the S4HANA server"
    value = aws_eip.s4hana-1_eip.public_ip
}
output "s4hana-server-2-private-ip" {
    description = "value of the private IP address of the S4HANA server"
    value = module.sap-s4hana-2.private_ip
}
output "s4hana-server-2-public-ip" {
    description = "value of the public IP address of the S4HANA server"
    value = aws_eip.s4hana-2_eip.public_ip
}