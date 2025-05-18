module "blues" {
  for_each      = toset(var.blue_servers)
  source = "../../modules/ec2"
  environment = var.environment
  security_groups = var.security_groups
  key_pair = var.key_pair
  tag_name = var.tag_name

} 

# results of the above code in a array
output "blue_servers" {
  value = { for k, v in module.blues : k => v.instance_private_ip }
}


module "blue_target_group" {
  source = "../../modules/target_group"
  name = "blue-target-group"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  target_ids = output.blue_servers.value

}