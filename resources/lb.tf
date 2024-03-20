resource "aws_elb" "TF-LB" {
  name    = "TF-LB"
  subnets = [aws_subnet.Web-1.id, aws_subnet.Web-2.id, aws_subnet.Web-3.id]
  security_groups = [aws_security_group.LbNSG.id]
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
    Name = "TF-LB"
  }
}

