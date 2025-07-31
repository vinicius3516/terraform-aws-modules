# VPC
output "vpc_id" {
  description = "VPC ID created."
  value       = aws_vpc.main.id
}
output "public_subnet_ids" {
  description = "Public Subnet IDs created."
  value       = aws_subnet.public[*].id
}
output "private_subnet_ids" {
  description = "Private Subnet IDs created."
  value       = aws_subnet.private[*].id
}