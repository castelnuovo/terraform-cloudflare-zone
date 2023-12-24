resource "cloudflare_record" "dmarc" {
  type    = "TXT"
  name    = "_dmarc"
  value   = "v=DMARC1; p=reject; adkim=s; aspf=s; rua=mailto:${var.dmarc_email};"
  zone_id = var.zone_id
}

# ---------------------------------------------------------------------------------------------------------------------
# Production
# ---------------------------------------------------------------------------------------------------------------------

resource "cloudflare_record" "spf" {
  type    = "TXT"
  name    = "@"
  value   = "v=spf1 include:spf.mtasv.net ~all"
  zone_id = var.zone_id
}

resource "cloudflare_record" "mx" {
  type     = "MX"
  name     = "@"
  value    = "inbound.postmarkapp.com"
  priority = 10
  zone_id  = var.zone_id
}

resource "cloudflare_record" "dkim" {
  type    = "TXT"
  name    = var.dkim_selector
  value   = var.dkim_value
  zone_id = var.zone_id
}

resource "cloudflare_record" "bounce" {
  type    = "CNAME"
  name    = "pm-bounces"
  value   = "pm.mtasv.net"
  zone_id = var.zone_id
}

# ---------------------------------------------------------------------------------------------------------------------
# Staging
# ---------------------------------------------------------------------------------------------------------------------

resource "cloudflare_record" "spf-staging" {
  count = var.dkim_selector_staging == null ? 0 : 1

  type    = "TXT"
  name    = "staging"
  value   = "v=spf1 include:spf.mtasv.net ~all"
  zone_id = var.zone_id
}

resource "cloudflare_record" "mx-staging" {
  count = var.dkim_selector_staging == null ? 0 : 1

  type     = "MX"
  name     = "staging"
  value    = "inbound.postmarkapp.com"
  priority = 10
  zone_id  = var.zone_id
}

resource "cloudflare_record" "dkim-staging" {
  count = var.dkim_selector_staging == null ? 0 : 1

  type    = "TXT"
  name    = var.dkim_selector_staging
  value   = var.dkim_value_staging
  zone_id = var.zone_id
}

resource "cloudflare_record" "bounce-staging" {
  count = var.dkim_selector_staging == null ? 0 : 1

  type    = "CNAME"
  name    = "pm-bounces.staging"
  value   = "pm.mtasv.net"
  zone_id = var.zone_id
}
