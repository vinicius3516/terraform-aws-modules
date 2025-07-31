# Launch Template
variable "environment" {
  description = "Environment name."
  type        = string
}
variable "ami_id" {
  description = "AMI ID for the launch template."
  type        = string
}
variable "instance_type" {
  description = "Instance type for the launch template."
  type        = string
}
variable "security_group_id" {
  description = "Security Group ID for the launch template."
  type        = string
}
variable "key_name" {
  description = "Key name for the launch template."
  type        = string
}
variable "user_data" {
  description = "User data script to initialize the instance"
  type        = string
}

# Auto Scaling Group
variable "min_size" {
  description = "Minimum size of the Auto Scaling Group."
  type        = number
}
variable "max_size" {
  description = "Maximum size of the Auto Scaling Group."
  type        = number
}
variable "desired_capacity" {
  description = "Desired capacity of the Auto Scaling Group."
  type        = number
}
variable "tags" {
  description = "Tags for the Auto Scaling Group."
  type        = map(string)
  default     = {}
}
variable "private_subnet_ids" {
  description = "List of private subnet IDs."
  type        = list(string)
}
variable "target_group_arn" {
  description = "Target Group ARN."
  type        = string
}