module "networking" {
  source             = "./modules/networking"
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
}

module "security" {
  source               = "./modules/security"
  vpc_id               = module.networking.vpc_id
  bastion_allowed_cidr = var.bastion_allowed_cidr
}

module "compute" {
  source                = "./modules/compute"
  bastion_ami           = var.bastion_ami
  bastion_instance_type = var.bastion_instance_type
  key_name              = var.key_name
  public_subnet_id      = module.networking.public_subnet_ids[0]
  bastion_sg_id         = module.security.bastion_sg_id
  cluster_ami           = var.cluster_ami
  cluster_instance_type = var.cluster_instance_type
  private_subnet_ids    = module.networking.private_subnet_ids
  cluster_sg_id         = module.security.cluster_sg_id
  instance_count        = var.instance_count
  pem_file_path       = var.pem_file_path
}