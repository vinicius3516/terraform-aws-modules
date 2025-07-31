# Security Group
resource "aws_security_group" "main" {
  vpc_id = var.vpc_id
  tags = {
    Name        = "sg-${var.environment}"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Ingress Rules
resource "aws_vpc_security_group_ingress_rule" "ingress" {
  for_each          = { for port in var.port_number : port => port }
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = each.value
  to_port           = each.value
  ip_protocol       = "tcp"
}

# Egress Rules
resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.main.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"
}