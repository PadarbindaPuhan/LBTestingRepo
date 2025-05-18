module "allow_all_security_group" {
  source = "./modules/securitygroup"
  environment = var.environment
}

module "keypair" {
  source        = "./modules/keypair"
  key_name      = "dev-keypair"
  public_key    = var.keypair_public_key
  environment   = var.environment
  
}

module "blue_servers" {
  blue_servers = var.blue_servers
  source        = "./application/blue"
  ami           = "ami-075686beab831bb7f"
  instance_type = "t3.micro"
  subnet_id     = "subnet-0db2c89226baaf431"
  environment   = var.environment
  security_groups = [module.allow_all_security_group.security_group_id]
  key_pair      = module.keypair.key_name
  
}

module "green_servers" {
  blue_servers = var.green_servers
  source        = "./application/blue"
  ami           = "ami-075686beab831bb7f"
  instance_type = "t3.micro"
  subnet_id     = "subnet-0db2c89226baaf431"
  environment   = var.environment
  security_groups = [module.allow_all_security_group.security_group_id]
  key_pair      = module.keypair.key_name
  
}
