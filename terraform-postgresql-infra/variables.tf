variable "vpc_cidr" {}
variable "public_subnets" {
  type = list(string)
}
variable "private_subnets" {
  type = list(string)
}
variable "availability_zones" {
  type = list(string)
}
variable "bastion_ami" {}
variable "bastion_instance_type" {}
variable "key_name" {}
variable "bastion_allowed_cidr" {}
variable "cluster_ami" {}
variable "cluster_instance_type" {}
variable "instance_count" {}

variable "pem_file_path" {
  description = "Path to PEM file"
  type        = string
}


