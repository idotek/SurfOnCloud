# Prod load balancer
resource "aws_elb" "lb_prod" {
  name    = "LB-Prod"
  subnets = [aws_subnet.Web-1.id, aws_subnet.Web-2.id, aws_subnet.Web-3.id]
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

  instances                   = [aws_instance.Web1.id, aws_instance.Web2.id, aws_instance.Web3.id]
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
  subnets = [aws_subnet.WebDev-1.id, aws_subnet.WebDev-2.id, aws_subnet.WebDev-3.id]
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

  instances                   = [aws_instance.WebDev-1.id, aws_instance.WebDev-2.id, aws_instance.WebDev-3.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "LB-Internal"
  }
}

