module "sap-s4hana" {
  source = "./modules/s4-hana"
  count = 1
  security_group_name = "${var.s4_hana_security_group_name}-${count.index}"
  ec2_name            = "${var.s4_hana_ec2_name}-${count.index}"
  vpc-id              = aws_vpc.vpc.id
  keypair-id          = aws_key_pair.key_pair.id
  subnet-id           = aws_subnet.subnet.id
  instance_type       = var.s4_hana_instance_type
}