output "target_group_arn" {
  description = "Target Group ARN created."
  value       = aws_lb_target_group.main.arn
}
output "dns_name" {
  description = "ALB DNS name created."
  value = aws_lb.main.dns_name
}