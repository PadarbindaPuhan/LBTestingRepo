output "instance_ip_address" {
  description = "The public IP address of the web app instance"
  value       = aws_instance.web_app.public_ip
  
}

output "instance_private_ip" {
  description = "The ID of the web app instance"
  value       = aws_instance.web_app.private_ip
}