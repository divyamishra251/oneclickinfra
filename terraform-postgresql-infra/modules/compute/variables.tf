variable "bastion_ami" {}
variable "bastion_instance_type" {}
variable "key_name" {}
variable "public_subnet_id" {}
variable "bastion_sg_id" {}

variable "cluster_ami" {}
variable "cluster_instance_type" {}
variable "private_subnet_ids" {
  type = list(string)
}
variable "cluster_sg_id" {}
variable "instance_count" {}

variable "pem_file_path" {
  description = "Path to PEM file for connecting to bastion from Jenkins"
  type        = string
}

