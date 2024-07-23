

resource "aws_security_group" "default" {
  name        = "${var.project}-eks-cluster-ec2-sg-${var.env}" 
  description = "${var.project}-eks-cluster-ec2-sg-${var.env}"
  vpc_id = "${var.vpc_id}"
   tags = {
    Terraform   = "true"
    Environment = "${var.env}"
    propagate_at_launch = true
    Name              = "${var.project}-eks-cluster-ec2-sg-${var.env}"
    
  }
}



resource "aws_security_group_rule" "tcp" {
  count             = "${var.tcp_ports == "default_null" ? 0 : length(split(",", var.tcp_ports))}"
  type              = "ingress"
  from_port         = "${element(split(",", var.tcp_ports), count.index)}"
  to_port           = "${element(split(",", var.tcp_ports), count.index)}"
  protocol          = "tcp"
  cidr_blocks       = ["${element(var.cidrs, count.index)}"] 
  #description       = "etddd"
  security_group_id = "${aws_security_group.default.id}"
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "All egress traffic"
  security_group_id = "${aws_security_group.default.id}"
}


resource "aws_security_group_rule" "udp" {
  count             = "${var.udp_ports == "default_null" ? 0 : length(split(",", var.udp_ports))}"
  type              = "ingress"
  from_port         = "${element(split(",", var.udp_ports), count.index)}"
  to_port           = "${element(split(",", var.udp_ports), count.index)}"
  protocol          = "udp"
  cidr_blocks       = var.cidrs  
  security_group_id = "${aws_security_group.default.id}"
}





