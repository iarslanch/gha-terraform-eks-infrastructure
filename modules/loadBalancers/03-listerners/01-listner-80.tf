
resource "aws_lb_listener" "loadbalancer_listener" {
    load_balancer_arn     = "${var.load_balancer_arn}"
    port                  = "${var.aws_lb_listener_port}"
    protocol              = "${var.aws_lb_listener_protocol}"

  default_action {
    type                  = "${var.aws_lb_listener_type}"
    target_group_arn      = "${var.target_group_arn}"

    redirect {
      port                = "${var.aws_lb_listener_redirect_port}"
      protocol            = "${var.aws_lb_listener_redirect_protocol}"
      status_code         = "${var.aws_lb_listener_redirect_status_code}"
    }
  }
    # Include ssl_policy and certificate_arn for HTTPS listeners
    ssl_policy        = "${var.aws_lb_listener_ssl_policy}"
    certificate_arn   = "${var.aws_lb_listener_certificate_arn}"
}





  
