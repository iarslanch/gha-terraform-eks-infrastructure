    
###############################################
#### Allpication Load Balancer Creation ####
###############################################


resource "aws_lb" "this" {
  name                               = "${var.alb_name}-loadbalancer-${var.env}" 
  internal                           = "${var.aws_lb_internal_values}"
	enable_deletion_protection         = "${var.enable_deletion_protection}"
  idle_timeout                       = "${var.idle_timeout}" 
  security_groups                    = [aws_security_group.default.id]
  subnets                            = [var.web_public_subnet01, var.web_public_subnet02]
  load_balancer_type                 = "${var.load_balancer_type}"
  ip_address_type                    = "${var.ip_address_type}"

timeouts {}
  
#  access_logs {
#           enabled = true
#           bucket  = "prod-alb-logs-ap-southeast-2-660577095827"
#           #bucket = aws_s3_bucket.alb_access_logs.id
#            prefix  = "prod-alb" 
#         }

tags = {
    Terraform   = "true"
    Environment = "${var.env}"
    propagate_at_launch = true
    Name              = "${var.alb_name}-loadbalancer-${var.env}" 
  }
  
}





