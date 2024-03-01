resource "aws_lb" "web_alb" {
  name               = "${local.name}-${var.tags.Component}" #roboshop-dev-app-alb
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.web_alb_sg_id.value]
  subnets            = split(",", data.aws_ssm_parameter.public_subnet_ids.value)

  #enable_deletion_protection = true

  tags = merge(
    var.common_tags,
    var.tags
  )
}