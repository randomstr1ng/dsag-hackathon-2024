# Extract the latest Ubuntu 22.04 AMI ID
data "aws_ami" "ubuntu-2204" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name  = "architecture"
    values = ["x86_64"]
  }

  owners = ["099720109477"] # Canonical
}

# Create EC2 Instance for Admin Server
resource "aws_instance" "admin-server" {
  instance_type          = var.admin-server-size
  ami                    = data.aws_ami.ubuntu-2204.id
  key_name               = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.admin-server-security_group.id]
  subnet_id              = aws_subnet.subnet.id
  user_data              = base64encode(templatefile("${path.module}/configs/admin-server-config.tftpl", {})) 

  tags = {
    Name = var.admin-server-name
  }

  root_block_device {
    volume_size = 15
  }
}

# Create Security Group for Admin Server
resource "aws_security_group" "admin-server-security_group" {
  name        = var.admin-server-security-group-name
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
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    description = "HTTP"
    cidr_blocks = ["0.0.0.0/0"]
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

resource "aws_eip" "admin-server-eip" {
  instance = aws_instance.admin-server.id
}