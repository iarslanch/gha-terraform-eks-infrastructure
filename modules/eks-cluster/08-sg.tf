resource "aws_security_group_rule" "tcp" {
  count             = length(var.tcp_ports)
  type              = "ingress"
  from_port         = tonumber(var.tcp_ports[count.index])
  to_port           = tonumber(var.tcp_ports[count.index])
  protocol          = "tcp"
  cidr_blocks       = count.index < length(var.cidrs) ? [var.cidrs[count.index]] : ["0.0.0.0/0"]
  security_group_id = aws_security_group.default.id
}



resource "aws_security_group_rule" "udp" {
  count             = length(var.udp_ports)
  type              = "ingress"
  from_port         = tonumber(var.udp_ports[count.index])
  to_port           = tonumber(var.udp_ports[count.index])
  protocol          = "udp"
  cidr_blocks       = count.index < length(var.cidrs) ? [var.cidrs[count.index]] : ["0.0.0.0/0"]
  security_group_id = aws_security_group.default.id
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default.id
}
