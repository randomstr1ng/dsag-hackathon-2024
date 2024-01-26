variable "aws_profile" {
  type    = string
  default = "default"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

# Network Variables
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/24"
}

variable "vpc_name" {
  type    = string
  default = "dsag-hackathon-vpc"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.0.0/26"
}

variable "igw_name" {
  type    = string
  default = "dsag-hackathon-igw"
}

variable "subnet_name" {
  type    = string
  default = "dsag-hackathon-subnet"
}

# Admin Server Variables
variable "admin-server-name" {
  type    = string
  default = "dsag-hackathon-admin-server"
}

variable "admin-server-size" {
    type    = string
    default = "t3.micro"
}

variable "admin-server-security-group-name" {
    type    = string
    default = "dsag-hackathon-admin-server-security-group"  
}

# S4HANA Server Variables
variable "s4_hana_ec2_name" {
  type    = string
  default = "dsag-s4hana-server"
}
variable "s4_hana_security_group_name" {
    type    = string
    default = "dsag-s4hana-security-group"
}
variable "s4_hana_instance_type" {
    type    = string
    default = "m5.2xlarge"
}

# Jump Host variables
variable "jump_host_name" {
  type    = string
  default = "dsag-hackathon-jump-host"
}

variable "jump_host_security_group_name" {
    type    = string
    default = "dsag-hackathon-jump-host-security-group"
}

variable "jump_host_instance_type" {
    type    = string
    default = "t3.large"
}

variable "amount_of_jump_hosts" {
    type    = number
    default = 2
}

variable "jump_host_ami" {
    type    = string
    default = "ami-09644592a343dacc7"
}