
resource "aws_lb_target_group" "target_group" {
  name                               =  "${var.target_group_name}-${var.env}-tg"
  port                               =  "${var.target_port}"
  protocol                           =  "${var.target_protocol}"
  target_type                        =  "${var.target_type}"
  vpc_id                             =  "${var.vpc_id}"           
  connection_termination             =  "${var.target_connection_termination}"
  lambda_multi_value_headers_enabled =  "${var.target_lambda_multi_value_headers_enabled}"
  depends_on                         =   [var.load_balancer_arn]

  health_check {
    interval                         = "${var.target_health_check_interval}"
    path                             = "${var.target_health_check_path}"
    protocol                         = "${var.target_health_check_protocol}"
    timeout                          = "${var.target_health_check_timeout}"
    healthy_threshold                = "${var.target_health_check_healthy_threshold}" 
    unhealthy_threshold              = "${var.target_health_check_unhealthy_threshold}"
  }
  tags = {
    Name        = "${var.target_group_name}-${var.env}-tg"
  }
}






# ####*******************************************************
# ###                    TargerGroup 1                    ###
# ####*******************************************************

# resource "aws_lb_target_group" "target_group_1" {

#   name        = "${var.project}-backend-${var.env}-tg"
#   port        = 80
#   protocol    = "HTTP"
#   target_type = "instance"
#   vpc_id      =  var.vpc_id           
#   depends_on = [ aws_lb.this,]
#   connection_termination             = false
#   lambda_multi_value_headers_enabled = false

#   health_check {
#     interval            = 10
#     path                = "/"
#     protocol            = "HTTP"
#     timeout             = 5
#     healthy_threshold   = 5
#     unhealthy_threshold = 2
#   }
#   tags = {
#     Name        = "${var.project}-backend-${var.env}-tg"
#   }
# }

# ####*******************************************************
# ###                    TargerGroup 2                    ###
# ####******************************************************

# resource "aws_lb_target_group" "target_group_2" {

#   name        = "${var.project}-frontend-${var.env}-tg"
#   port        = 8080
#   protocol    = "HTTP"
#   target_type = "instance"
#   vpc_id      =  var.vpc_id           
#   depends_on = [ aws_lb.this,]
#   connection_termination             = false
#   lambda_multi_value_headers_enabled = false

#   health_check {
#     interval            = 10
#     path                = "/"
#     protocol            = "HTTP"
#     timeout             = 5
#     healthy_threshold   = 5
#     unhealthy_threshold = 2
#   }
#   tags = {
#     Name        = "${var.project}-backend-${var.env}-tg"
#   }
# }


####*******************************************************
###                    TargerGroup 2                    ###
####*******************************************************

# resource "aws_lb_target_group" "tg_2" {

#   name        = "${var.project}-vp-${var.env}-tg"
#   port        = 8080
#   protocol    = "HTTP"
#   target_type = "instance"
#   vpc_id      =  var.vpc_id           
#   depends_on = [ aws_lb.this,]

#   health_check {
#     interval            = 10
#     path                = "/"
#     protocol            = "HTTP"
#     timeout             = 5
#     healthy_threshold   = 5
#     unhealthy_threshold = 2
#   }
#   tags = {
#     Name        = "${var.project}-vp-${var.env}-tg"
#   }
# }


# ####*******************************************************
# ###                    TargerGroup 3                    ###
# ####*******************************************************


# resource "aws_lb_target_group" "tg_3" {

#   name        = "${var.project-name}-liveticker-${var.env}-tg"
#   port        = 80
#   protocol    = "HTTP"
#   target_type = "instance"
#   vpc_id      =  var.vpc_id           
#   depends_on = [ aws_lb.this,]

#   health_check {
#     interval            = 10
#     path                = "/swagger/index.html"
#     protocol            = "HTTP"
#     timeout             = 5
#     healthy_threshold   = 5
#     unhealthy_threshold = 2
#   }
#   tags = {
#     Name        = "${var.project-name}-liveticker-${var.env}-tg"
#   }
# }



# ####*******************************************************
# ###                    TargerGroup 4                    ###
# ####*******************************************************

# resource "aws_lb_target_group" "tg_4" {

#   name        = "${var.project-name}-mobileadmin-web-${var.env}-tg"
#   port        = 80
#   protocol    = "HTTP"
#   target_type = "instance"
#   vpc_id      =  var.vpc_id           
#   depends_on = [ aws_lb.this,]

#   health_check {
#     interval            = 10
#     path                = "/swagger/index.html"
#     protocol            = "HTTP"
#     timeout             = 5
#     healthy_threshold   = 5
#     unhealthy_threshold = 2
#   }
#   tags = {
#     Name        = "${var.project-name}-mobileadmin-web-${var.env}-tg"
#   }
# }





# ####*******************************************************
# ###                    TargerGroup 5                    ###
# ####*******************************************************

# resource "aws_lb_target_group" "tg_5" {

#   name        = "${var.project-name}-vp-web-${var.env}-tg"
#   port        = 80
#   protocol    = "HTTP"
#   target_type = "instance"
#   vpc_id      =  var.vpc_id           
#   depends_on = [ aws_lb.this,]

#   health_check {
#     interval            = 10
#     path                = "/swagger/index.html"
#     protocol            = "HTTP"
#     timeout             = 5
#     healthy_threshold   = 5
#     unhealthy_threshold = 2
#   }
#   tags = {
#     Name        = "${var.project-name}-vp-web-${var.env}-tg"
#   }
# }