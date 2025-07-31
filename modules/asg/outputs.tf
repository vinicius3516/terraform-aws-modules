# Launch Template
output "launch_template_id" {
  description = "Launch Template ID created."
  value       = aws_launch_template.main.id
}