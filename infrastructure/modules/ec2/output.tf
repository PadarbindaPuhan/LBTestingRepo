output "instance_id" {
  description = "The ID of the web app instance"
  value       = aws_instance.web_app.id
}