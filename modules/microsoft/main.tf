data "cloudflare_zone" "this" {
  zone_id = var.zone_id
}

locals {
  # domain.tld -> domain-tld
  mx_domain = replace(data.cloudflare_zone.this.name, ".", "-")
}

resource "cloudflare_record" "verification" {
  zone_id = var.zone_id

  type  = "TXT"
  name  = "@"
  value = var.verification
}

resource "cloudflare_record" "spf" {
  zone_id = var.zone_id

  type  = "TXT"
  name  = "@"
  value = "v=spf1 include:spf.protection.outlook.com ~all"
}

resource "cloudflare_record" "mx" {
  zone_id = var.zone_id

  type     = "MX"
  name     = "@"
  value    = "${local.mx_domain}.mail.protection.outlook.com"
  priority = 1
}

resource "cloudflare_record" "dkim-1" {
  zone_id = var.zone_id

  type  = "CNAME"
  name  = "selector1._domainkey"
  value = "selector1-${local.mx_domain}._domainkey.proculair.onmicrosoft.com"
}

resource "cloudflare_record" "dkim-2" {
  zone_id = var.zone_id

  type  = "CNAME"
  name  = "selector2._domainkey"
  value = "selector2-${local.mx_domain}._domainkey.proculair.onmicrosoft.com"
}

resource "cloudflare_record" "dmarc" {
  zone_id = var.zone_id

  name  = "_dmarc"
  type  = "TXT"
  value = "v=DMARC1; p=reject; adkim=s; aspf=s; rua=mailto:${var.dmarc_email};"
}

resource "cloudflare_record" "mta-sts" {
  zone_id = var.zone_id

  type  = "TXT"
  name  = "_mta-sts"
  value = var.mta_sts_value
}

# TODO: fix
resource "cloudflare_record" "mta-sts-reports" {
  zone_id = var.zone_id

  type  = "TXT"
  name  = "_smtp._tls"
  value = "v=TLSRPTv1; rua=mailto:security@proculair.com;"
}

resource "cloudflare_record" "autodiscover" {
  zone_id = var.zone_id

  type  = "CNAME"
  name  = "autodiscover"
  value = "autodiscover.outlook.com"
}

resource "cloudflare_record" "lyncdiscover" {
  zone_id = var.zone_id

  type  = "CNAME"
  name  = "lyncdiscover"
  value = "webdir.online.lync.com"
}

resource "cloudflare_record" "enterpriseenrollment" {
  zone_id = var.zone_id

  type  = "CNAME"
  name  = "enterpriseenrollment"
  value = "enterpriseenrollment-s.manage.microsoft.com"
}

resource "cloudflare_record" "enterpriseregistration" {
  zone_id = var.zone_id

  type  = "CNAME"
  name  = "enterpriseregistration"
  value = "enterpriseregistration.windows.net"
}

resource "cloudflare_record" "sip" {
  zone_id = var.zone_id

  type  = "CNAME"
  name  = "sip"
  value = "sipdir.online.lync.com"
}

resource "cloudflare_record" "sip-federation" {
  zone_id = var.zone_id

  type = "SRV"
  name = "_sipfederationtls._tcp"
  data {
    name     = data.cloudflare_zone.this.name
    port     = 5061
    priority = 100
    proto    = "_tcp"
    service  = "_sipfederationtls"
    target   = "sipfed.online.lync.com"
    weight   = 1
  }
  priority = 100
}

resource "cloudflare_record" "sip-tls" {
  zone_id = var.zone_id

  type = "SRV"
  name = "_sip._tls"
  data {
    name     = data.cloudflare_zone.this.name
    port     = 443
    priority = 100
    proto    = "_tls"
    service  = "_sip"
    target   = "sipdir.online.lync.com"
    weight   = 1
  }
  priority = 100
}
