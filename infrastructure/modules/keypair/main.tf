resource "aws_key_pair" "machinekey" {
  key_name   = var.key_name
  public_key = var.public_key
    tags = {
        Name        = "${var.environment}-keypair"
        Environment = var.environment
    }
}