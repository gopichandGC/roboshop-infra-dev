resource "aws_cloudfront_distribution" "daws76s" {
  enabled             = true
  aliases             = ["web-${var.tags.Component}.${var.zone_name}"]
  origin {
    domain_name = "web-${var.environment}.${var.zone_name}"
    origin_id   = "web-${var.environment}.${var.zone_name}"
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }