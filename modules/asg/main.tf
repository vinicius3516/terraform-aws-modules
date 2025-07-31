# Launch Template
resource "aws_launch_template" "main" {
  name_prefix   = "lt-${var.environment}"
  image_id      = var.ami_id
  instance_type = var.instance_type

  key_name = var.key_name != null ? var.key_name : null


  vpc_security_group_ids = [var.security_group_id]

  user_data = var.user_data != null ? base64encode(var.user_data) : null

  block_device_mappings {
    device_name = "/dev/sda1" # or /dev/xvda, depending on the AMI
    ebs {
      volume_size           = 30
      volume_type           = "gp2"
      delete_on_termination = true
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "instance-${var.environment}"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }

  tag_specifications {
    resource_type = "volume"
    tags = {
      Name        = "volume-${var.environment}"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }

  tags = {
    Name        = "lt-${var.environment}"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

# Auto Scaling Group
resource "aws_autoscaling_group" "main" {
  name                = "asg-${var.environment}"
  vpc_zone_identifier = var.private_subnet_ids[*]
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity
  target_group_arns   = [var.target_group_arn] # Attaches to the ALB Target Group

  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest" # Always use the latest version of the Launch Template
  }

  health_check_type    = "ELB" # Uses Load Balancer's health check
  termination_policies = ["Default"]

  tag {
    key                 = "Name"
    value               = "asg-instance-${var.environment}"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = lookup(var.tags, "Environment", "default")
    propagate_at_launch = true
  }
}