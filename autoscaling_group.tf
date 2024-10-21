resource "aws_autoscaling_group" "web_app" {
  launch_template {
    id      = aws_launch_template.web_app.id
    version = "$Latest"
  }
  # min 2 for HA purposes
  min_size           = 2
  max_size           = 5
  desired_capacity   = 2
  vpc_zone_identifier = module.vpc.public_subnets
}