variable "environment" {
  description = "Environment name."
  type        = string
}
# Port number for Ingress Rules
variable "port_number" {
  description = "Port number for the ingress rule."
  type        = list(number)
}
variable "vpc_id" {
  description = "VPC ID."
  type        = string
}