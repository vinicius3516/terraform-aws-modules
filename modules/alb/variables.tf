# ALB
variable "environment" {
  description = "Environment name."
  type        = string
}
variable "security_group_id" {
  description = "Security Group ID for the ALB."
  type        = string
}
variable "subnet_public_id" {
  description = "Subnet ID for the ALB."
  type        = list(string)
}

# Target Group
variable "target_group_port" {
  description = "Port for the target group."
  type        = number
}
variable "target_group_protocol" {
  description = "Protocol for the target group."
  type        = string
}
variable "vpc_id" {
  description = "VPC ID."
  type        = string
}
# Health Check
variable "health_check_path" {
  description = "Path for the health check."
  type        = string
}
variable "health_check_port" {
  description = "Port for the health check."
  type        = string
}

# Listener
variable "listener_port" {
  description = "Port for the listener."
  type        = number
}
variable "listener_protocol" {
  description = "Protocol for the listener."
  type        = string
}