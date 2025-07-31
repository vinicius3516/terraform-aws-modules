# VPC
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC."
  type        = string
}
variable "environment" {
  description = "Environment name."
  type        = string
}
variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets."
  type        = list(string)
}
variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets."
  type        = list(string)
}