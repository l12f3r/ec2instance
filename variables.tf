variable "region" {
  description = "AWS region"
}

variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name for VPC"
  default     = "exemplo-vpc"
}

variable "subnet_cidr_block" {
  description = "CIDR block for subnet"
  default     = "10.0.0.0/24"
}

variable "availability_zone" {
  description = "Availability zone for subnet"
}

variable "subnet_name" {
  description = "Name for subnet"
  default     = "exemplo-subnet"
}

variable "security_group_name" {
  description = "Name for security group"
  default     = "exemplo-security-group"
}

variable "ingress_port" {
  description = "Ingress port"
  default     = 22
}

variable "ingress_protocol" {
  description = "Ingress protocol"
  default     = "tcp"
}

variable "ingress_cidr" {
  description = "Ingress CIDR block"
  default     = "0.0.0.0/0"
}

variable "egress_port" {
  description = "Egress port"
  default     = 0
}

variable "egress_protocol" {
  description = "Egress protocol"
  default     = "-1"
}

variable "egress_cidr" {
  description = "Egress CIDR block"
  default     = "0.0.0.0/0"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  default     = "ami-00b1c9efd33fda707"
}

variable "key_name" {
  description = "Key pair name"
}

variable "instance_type" {
  description = "Instance type for EC2 instance"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name for EC2 instance"
  default     = "exemplo-instance"
}