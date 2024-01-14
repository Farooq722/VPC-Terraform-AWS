module "vpc-module" {
  source       = "./modules/vpc"
  vpc-cidr     = var.vpc-cidr
  subnet-cidr  = var.subnet-cidr
  gateway-name = var.gateway-name
}

module "sg-module" {
  source = "./modules/sg"
  vpc-id = module.vpc-module.vpc
}

module "ec2" {
  source  = "./modules/ec2"
  sg-id   = module.sg-module.sg-id
  subnets = module.vpc-module.subnets
}

module "alb" {
  source = "./modules/alb"
  sg-id = module.sg-module.sg-id
  subnet-alb = module.vpc-module.subnets
  vpc-id-tg = module.vpc-module.vpc
  instances = module.ec2.instacne-1
}