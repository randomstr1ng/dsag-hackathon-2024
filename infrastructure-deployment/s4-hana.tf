module "sap-s4hana-1" {
  source = "./modules/s4-hana"
  security_group_name = "${var.s4_hana_security_group_name}-1"
  ec2_name            = "${var.s4_hana_ec2_name}-1"
  vpc-id              = aws_vpc.vpc.id
  keypair-id          = aws_key_pair.key_pair.id
  subnet-id           = aws_subnet.subnet.id
  instance_type       = var.s4_hana_instance_type
}
resource "aws_eip" "s4hana-1_eip" {
  instance = module.sap-s4hana-1.s4-hana_instance_id
}

module "sap-s4hana-2" {
  source = "./modules/s4-hana"
  security_group_name = "${var.s4_hana_security_group_name}-1"
  ec2_name            = "${var.s4_hana_ec2_name}-1"
  vpc-id              = aws_vpc.vpc.id
  keypair-id          = aws_key_pair.key_pair.id
  subnet-id           = aws_subnet.subnet.id
  instance_type       = var.s4_hana_instance_type
}
resource "aws_eip" "s4hana-2_eip" {
  instance = module.sap-s4hana-2.s4-hana_instance_id
}