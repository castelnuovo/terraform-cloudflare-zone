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
  value = "v=spf1 include:_spf.google.com ~all"
}

resource "cloudflare_record" "mx-0" {
  zone_id = var.zone_id

  type     = "MX"
  name     = "@"
  value    = "aspmx.l.google.com"
  priority = 1
}

resource "cloudflare_record" "mx-1" {
  zone_id = var.zone_id

  type     = "MX"
  name     = "@"
  value    = "alt1.aspmx.l.google.com"
  priority = 5
}

resource "cloudflare_record" "mx-2" {
  zone_id = var.zone_id

  type     = "MX"
  name     = "@"
  value    = "alt2.aspmx.l.google.com"
  priority = 5
}

resource "cloudflare_record" "mx-3" {
  zone_id = var.zone_id

  type     = "MX"
  name     = "@"
  value    = "alt3.aspmx.l.google.com"
  priority = 10
}

resource "cloudflare_record" "mx-4" {
  zone_id = var.zone_id

  type     = "MX"
  name     = "@"
  value    = "alt4.aspmx.l.google.com"
  priority = 10
}

resource "cloudflare_record" "dkim" {
  zone_id = var.zone_id

  type  = "TXT"
  name  = "google._domainkey"
  value = var.dkim_value
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

resource "cloudflare_record" "service-calendar" {
  zone_id = var.zone_id

  type  = "CNAME"
  name  = "calendar"
  value = "ghs.googlehosted.com"
}

resource "cloudflare_record" "service-drive" {
  zone_id = var.zone_id

  type  = "CNAME"
  name  = "drive"
  value = "ghs.googlehosted.com"
}

resource "cloudflare_record" "service-mail" {
  zone_id = var.zone_id

  type  = "CNAME"
  name  = "mail"
  value = "ghs.googlehosted.com"
}

resource "cloudflare_record" "service-groups" {
  zone_id = var.zone_id

  type  = "CNAME"
  name  = "groups"
  value = "ghs.googlehosted.com"
}

resource "cloudflare_record" "service-sites" {
  zone_id = var.zone_id

  type  = "CNAME"
  name  = "sites"
  value = "ghs.googlehosted.com"
}
