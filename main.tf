provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
}


module "ec2" {
  source        = "./modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  
  subnet_id = module.vpc.public_subnet_ids[0]
#   subnet_id     = module.vpc.public_subnet_id
  sg_id         = module.vpc.web_sg_id
  key_name      = var.key_name
}

module "rds" {
  source              = "./modules/rds"
  private_subnet_ids  = module.vpc.private_subnet_ids
  db_sg_id            = module.vpc.db_sg_id
  instance_class      = var.db_instance_class
  db_name             = var.db_name
  db_username         = var.db_username
  db_password         = var.db_password
}
