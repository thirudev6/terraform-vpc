resource "aws_elb" "tomcat" {
  name               = "tomcat-terraform-elb"
  subnets	     = [aws_subnet.pub.id, aws_subnet.public.id]
  
  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8080/"
    interval            = 30
  }

  instances                   = [aws_instance.tomcat.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "tomcat-terraform-elb"
  }
}
