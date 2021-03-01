# Create Route 53 records

resource "aws_route53_record" "records" {
  count = "1"

  zone_id = var.zone_id
  name    = var.alias
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.distribution.domain_name
    zone_id                = aws_cloudfront_distribution.distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

# Create CloudFront distribution

resource "aws_cloudfront_distribution" "distribution" {
  wait_for_deployment = false

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "regional"
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 31536000
    default_ttl            = 31536000
    max_ttl                = 31536000
    compress               = true
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = var.cert_arn
    ssl_support_method  = "sni-only"
  }

  aliases = [var.alias]

  enabled     = true
  price_class = "PriceClass_All"

  comment = var.prefix

  origin {
    domain_name = var.regional_alias
    origin_path = ""
    origin_id   = "regional"
    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_ssl_protocols   = ["TLSv1", "TLSv1.1", "TLSv1.2"]
      origin_protocol_policy = "https-only"
    }
  }
}