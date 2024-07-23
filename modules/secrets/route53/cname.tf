




resource "aws_route53_record" "cname_1" {
  zone_id = aws_route53_zone.hosted_zone_1.zone_id
  name    = "demo.cloudnet.shop"
  type    = "CNAME"
  ttl     = 60
  records         = ["${var.alb_dns}"]
}
