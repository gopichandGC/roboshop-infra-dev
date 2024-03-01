resource "aws_lb_target_group" "web" {
  name     = "${local.name}-${var.tags.Component}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_ssm_parameter.vpc_id.value
  deregistration_delay = 60
  health_check {
      healthy_threshold   = 2
      interval            = 10
      unhealthy_threshold = 3
      timeout             = 5
      path                = "/health"
      port                = 80
      matcher = "200-299"
  }
}

module "web" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  ami = data.aws_ami.centos8.id
  name                   = "${local.name}-${var.tags.Component}-ami"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.web_sg_id.value]
  subnet_id              = element(split(",", data.aws_ssm_parameter.private_subnet_ids.value), 0)
  iam_instance_profile = "ShellScriptRoleForRoboshop"
  tags = merge(
    var.common_tags,
    var.tags
  )
}