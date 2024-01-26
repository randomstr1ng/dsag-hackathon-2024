# Deploy Custom Kali Linux AMI to AWS for each team
# Create EC2 Instance for Admin Server
resource "aws_instance" "jump-host" {
  count                  = var.amount_of_jump_hosts
  ami                    = var.jump_host_ami
  instance_type          = var.jump_host_instance_type
  key_name               = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.jump-host-security_group.id]
  subnet_id              = aws_subnet.subnet.id
  user_data              = base64encode(templatefile("${path.module}/configs/jump-host-config.tftpl", {}))

  tags = {
    Name = "${var.jump_host_name}-${count.index}"
  }

  root_block_device {
    volume_size = 40
  }
}

# Create Security Group for Jump Host
resource "aws_security_group" "jump-host-security_group" {
  name        = var.jump_host_security_group_name
  description = "Security group automatically created by Terraform"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    description = "SSH access"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
    description = "Apache Guacamole Webinterface"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    description = "Allow all ports inter-vpc"
    cidr_blocks = [var.subnet_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Create Elastic IP for Admin Server

resource "aws_eip" "jump-host-eip" {
  for_each = toset(aws_instance.jump-host)
  instance = each.value.id
}