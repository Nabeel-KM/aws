module "VPC" {
  source = "./modules/VPC"
}


module "EC2" {
  source        = "./modules/EC2"
  aws_subnet_id = module.VPC.aws_subnet_id
  vpc_id        = module.VPC.vpc_id
}