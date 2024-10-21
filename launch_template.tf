resource "aws_launch_template" "web_app" {
  name_prefix   = "web-app"
  instance_type = var.instance_type
  image_id      = var.image_id
  network_interfaces {
    associate_public_ip_address = true
    subnet_id                   = element(module.vpc.public_subnets, 0)  # Use a public subnet
    security_groups             = [aws_security_group.web_sg.id]
  }
  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum -y install httpd
    echo "<p> AHL Logics! </p>" >> /var/www/html/index.html
    sudo systemctl enable httpd
    sudo systemctl start httpd
  EOF
  )
}