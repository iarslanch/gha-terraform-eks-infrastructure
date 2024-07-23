resource "aws_route53_zone" "hosted_zone_1" {  
        name          = "cloudnet.shop"
lifecycle {
  ignore_changes = [ comment, force_destroy ]
}

}