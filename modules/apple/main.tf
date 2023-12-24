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
  value = "v=spf1 include:icloud.com ~all"
}

resource "cloudflare_record" "mx-1" {
  zone_id = var.zone_id

  type     = "MX"
  name     = "@"
  value    = "mx01.mail.icloud.com"
  priority = 10
}

resource "cloudflare_record" "mx-2" {
  zone_id = var.zone_id

  type     = "MX"
  name     = "@"
  value    = "mx02.mail.icloud.com"
  priority = 10
}

resource "cloudflare_record" "dkim" {
  zone_id = var.zone_id

  type  = "TXT"
  name  = "sig1._domainkey"
  value = var.dkim_value
}

resource "cloudflare_record" "dmarc" {
  zone_id = var.zone_id

  name  = "_dmarc"
  type  = "TXT"
  value = "v=DMARC1; p=reject; adkim=s; aspf=s; rua=mailto:${var.dmarc_email};"
}
