output "instance_ip_address" {
  description = "The public IP address of the web app instance"
  value       = aws_instance.web_app.public_ip
  
}