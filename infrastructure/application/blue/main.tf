module "blues" {
  for_each      = toset(var.blue_servers)
  tag_name = each.value
  source = "../../modules/ec2"
  environment = var.environment
  security_groups = var.security_groups
  key_pair = var.key_pair
  #tag_name = var.tag_name

} 

# # results of the above code in a array
locals {
  all_blue_servers = [for m in values(module.blues) : m.instance_id]
}


module "blue_target_group" {
  source = "../../modules/target_group"
  name = "blue-target-group"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  target_ids =  local.all_blue_servers
}