output "bastion_public_ip" {
  value = module.compute.bastion_public_ip
}
output "bastion_private_ip" {
  value = module.compute.bastion_private_ip
}
output "cluster_private_ips" {
  value = module.compute.cluster_private_ips
}