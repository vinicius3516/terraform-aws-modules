# Security Group
output "security_group_id" {
  description = "Security Group ID createc."
  value       = aws_security_group.main.id
}