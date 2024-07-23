##################################################
#### Allpication Load Balancer Listener Rule 443 ####
#################################################


resource "aws_lb_listener_rule" "rules" {
  listener_arn        = "${var.loadbalancer_listener_arn}"
  priority            = "${var.listener_rule_priority}"

  action {
    type              = "${var.listener_rule_type}"
    target_group_arn  = "${var.target_group_arn}"
  }

  condition {
    host_header {
      values          = "${var.listener_rule_value}"
    }
  }
}


##################################################
#### Allpication Load Balancer Listener Rule 443 ####
#################################################



# resource "aws_lb_listener_rule" "rule_2" {
#   listener_arn = aws_lb_listener.listener-443.arn
#   priority     = 3

#   action {
#     type             = "forward"
#   target_group_arn = aws_lb_target_group.target_group_2.arn
#   }

#   condition {
#     host_header {
#       values = ["test.cloudnet.shop"]
#     }
#   }
# }










# resource "aws_lb_target_group_attachment" "test" {
#   target_group_arn = "${aws_lb_target_group.tg_2.arn}"
#   target_id        =    "i-0244d021dc72d002b"  # "${aws_instance.i-0cc40d34d72d1dc13.id}"
#   port             = 80
# }

	


/*


resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.front_end.arn
  port              = "80"
  protocol          = "HTTP"


/*

resource "aws_lb_target_group_attachment" "my-alb-target-group-attachment1" {
  target_group_arn = "${aws_lb_target_group.my-target-group.arn}"
  target_id        = "${var.instance1_id}"
  port             = 80
}


/*
resource "aws_lb_listener" "my-test-alb-listner" {
  load_balancer_arn = "${aws_lb.my-aws-alb.arn}"
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.my-target-group.arn}"
  }
}

*/