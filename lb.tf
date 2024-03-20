# Prod load balancer
resource "aws_elb" "lb_prod" {
  name    = "LB-Prod"
  subnets = [aws_subnet.subnet_01_prod.id, aws_subnet.subnet_02_prod.id, aws_subnet.subnet_03_prod.id]
  security_groups = [aws_security_group.lb_prod_nsg.id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = [aws_instance.web_01_prod.id, aws_instance.web_02_prod.id, aws_instance.web_03_prod.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "LB-Prod"
  }
}

# Internal load balancer
resource "aws_elb" "lb_internal" {
  name    = "LB-Internal"
  subnets = [aws_subnet.subnet_01_internal.id, aws_subnet.subnet_02_internal.id, aws_subnet.subnet_03_internal.id]
  security_groups = [aws_security_group.lb_internal_nsg.id]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = [aws_instance.server_01_internal.id, aws_instance.server_02_internal.id, aws_instance.server_03_internal.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "LB-Internal"
  }
}

