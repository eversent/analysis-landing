data "aws_route53_zone" "youpost_io" {
  name = "youpost.io."
}

resource "aws_route53_record" "appt_ns" {
  zone_id = data.aws_route53_zone.youpost_io.zone_id
  name    = local.domain
  type    = "NS"
  ttl     = 300
  records = aws_route53_zone.analysis_youpost_io.name_servers
}

resource "aws_route53_zone" "analysis_youpost_io" {
  name = "${local.domain}."
}


resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.analysis_youpost_io.zone_id
  name    = "www"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.analysis_youpost_io_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.analysis_youpost_io_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "root" {
  zone_id = aws_route53_zone.analysis_youpost_io.zone_id
  name    = ""
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.analysis_youpost_io_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.analysis_youpost_io_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}