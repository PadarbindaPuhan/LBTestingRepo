resource "aws_instance" "web_app" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_groups
  key_name      = var.key_pair
  availability_zone = var.availability_zone
  tags = {
    Name        = "${var.environment}-${var.tag_name}-web-app-instance"
    Environment = var.environment
  }
} 