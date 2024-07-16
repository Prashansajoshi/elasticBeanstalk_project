module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "subnet" {
  source                = "./modules/subnet"
  vpc_id                = module.vpc.prashansa_terraform_vpc
  subnet_cidr           = var.subnet_cidr
  subnet_cidr_public_2  = var.subnet_cidr_public_2
  subnet_cidr_private_1 = var.subnet_cidr_private_1
  subnet_cidr_private_2 = var.subnet_cidr_private_2
  availability_zone_1   = var.availability_zone_1
  availability_zone_2   = var.availability_zone_2

}

module "security_group" {
  source         = "./modules/security_group"
  vpc_id         = module.vpc.prashansa_terraform_vpc
  all_cidr_block = var.all_cidr_block
}

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.prashansa_terraform_vpc
}

module "rt" {
  source         = "./modules/rt"
  vpc_id         = module.vpc.prashansa_terraform_vpc
  all_cidr_block = var.all_cidr_block
  igw_id         = module.igw.igw_id
}

module "rt_association" {
  source                 = "./modules/rt_association"
  public_subnet_1_id     = module.subnet.public_subnet_1
  public_subnet_2_id     = module.subnet.public_subnet_2
  private_subnet_1_id    = module.subnet.private_subnet_1
  private_subnet_2_id    = module.subnet.private_subnet_2
  public_route_table_id  = module.rt.public_rt_1
  private_route_table_id = module.rt.private_rt_1
}

module "ec2" {
  source                       = "./modules/ec2"
  ami                          = var.ami
  instance_type                = var.instance_type
  key_name                     = var.key_name
  security_group_id            = module.security_group.security_group_id
  prashansa_terraform_subnet_1 = module.subnet.public_subnet_1
  prashansa_terraform_subnet_2 = module.subnet.public_subnet_2
  aws_iam_instance_profile     = module.iam.aws_iam_instance_profile
}


module "template_files" {
  source   = "hashicorp/dir/template"
  base_dir = "${path.module}/website"
}

# module "s3" {
#   source         = "./modules/s3"
#   template_files = module.template_files.files
# }

module "rds" {
  source                               = "./modules/rds"
  db_security_group_id                 = module.security_group.db_security_group_id
  prashansa_terraform_subnet_private_1 = module.subnet.private_subnet_1
  prashansa_terraform_subnet_private_2 = module.subnet.private_subnet_2
}

module "alb" {
  source          = "./modules/load_balancer"
  sg_id           = module.security_group.security_group_id
  public_subnet_1 = module.subnet.public_subnet_1
  public_subnet_2 = module.subnet.public_subnet_2
  ec2_id_1        = module.ec2.ec2_id_1
  ec2_id_2        = module.ec2.ec2_id_2
  vpc_id          = module.vpc.prashansa_terraform_vpc
  # subnet_id = module.subnet.public_subnet_1
}

module "s3_bucket" {
  source                  = "./modules/s3"
  bucket_name             = var.bucket_name
  acl                     = var.acl
  versioning              = var.versioning
  tags                    = var.tags
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

module "iam" {
  source = "./modules/iam"
}
