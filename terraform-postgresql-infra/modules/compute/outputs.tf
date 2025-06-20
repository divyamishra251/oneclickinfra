output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}
output "bastion_private_ip" {
  value = aws_instance.bastion.private_ip
}
output "cluster_private_ips" {
  value = aws_instance.postgresql_cluster[*].private_ip
}