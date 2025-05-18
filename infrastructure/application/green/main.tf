module "greens" {
  for_each      = toset(var.green_servers)
  source = "../../modules/ec2"
  environment = var.environment
  security_groups = var.security_groups
  key_pair = var.key_pair
  tag_name = var.tag_name
} 