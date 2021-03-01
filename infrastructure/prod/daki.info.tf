data "aws_route53_zone" "main" {
  name = "${local.domain}."
}

data "aws_acm_certificate" "cert" {
  domain   = local.domain
  statuses = ["ISSUED"]
}

module "daki-info" {
  source          = "../modules/daki.info"
  prefix          = local.prefix
  cert_arn        = data.aws_acm_certificate.cert.arn
  alias           = "${local.alias}"
  regional_alias  = "${local.regional_alias}"
  zone_id         = data.aws_route53_zone.main.zone_id
}