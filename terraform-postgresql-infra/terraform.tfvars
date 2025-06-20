vpc_cidr           = "10.0.0.0/16"
public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets    = ["10.0.101.0/24", "10.0.102.0/24"]
availability_zones = ["ap-south-1a", "ap-south-1b"]

bastion_ami           = "ami-0cda377a1b884a1bc"
bastion_instance_type = "t2.micro"
key_name              = "apsouth"
bastion_allowed_cidr  = "0.0.0.0/0"

cluster_ami           = "ami-0cda377a1b884a1bc"
cluster_instance_type = "t2.micro"
instance_count        = 2