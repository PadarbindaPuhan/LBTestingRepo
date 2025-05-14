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

variable "instance_names" {
  type    = list(string)
  default = ["web-1", "web-2", "web-3", "web-4", "web-5"]
}

module "web_application_server" {
  #count         = var.instance_count # Number of instances to create  
  for_each      = toset(var.instance_names)
  instance_names = each.value
  source        = "./modules/ec2"
  ami           = "ami-075686beab831bb7f"
  instance_type = "t3.micro"
  subnet_id     = "subnet-0db2c89226baaf431"
  environment   = var.environment
  security_groups = [module.allow_all_security_group.security_group_id]
  key_pair      = module.keypair.key_name

 
}



