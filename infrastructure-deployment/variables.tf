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