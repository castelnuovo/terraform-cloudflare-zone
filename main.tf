# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# MANAGE A CLOUDFLARE ZONE
#   - manage zone settings
#   - manage apple mail
#   - manage google workspace
#   - manage microsoft365
#   - manage postmark
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

resource "cloudflare_zone" "this" {
  account_id = var.account_id
  zone       = var.domain
  plan       = var.plan
  jump_start = false
}

resource "cloudflare_zone_settings_override" "this" {
  zone_id = cloudflare_zone.this.id

  settings {
    ssl                      = "strict"
    always_use_https         = "on"
    opportunistic_encryption = "on"
    tls_1_3                  = "on"
    automatic_https_rewrites = "on"
    tls_client_auth          = "on"
    min_tls_version          = "1.2"
    security_level           = var.settings_securitylevel
  }
}

resource "cloudflare_zone_dnssec" "this" {
  zone_id = cloudflare_zone.this.id
}

# ---------------------------------------------------------------------------------------------------------------------
# MAIL SETTINGS
# These optional modules manage mail settings for the zone.
# ---------------------------------------------------------------------------------------------------------------------

module "apple" {
  source = "./modules/apple"
  count  = length(var.apple) > 0 ? 1 : 0

  zone_id = cloudflare_zone.this.id

  verification  = var.apple.verification
  dkim_value    = var.apple.dkim_value
  dmarc_email   = var.apple.dmarc_email
  mta_sts_value = var.apple.mta_sts_value
}

module "google" {
  source = "./modules/google"
  count  = length(var.google) > 0 ? 1 : 0

  zone_id = cloudflare_zone.this.id

  verification  = var.google.verification
  dkim_value    = var.google.dkim_value
  dmarc_email   = var.google.dmarc_email
  mta_sts_value = var.google.mta_sts_value
}


module "microsoft" {
  source = "./modules/microsoft"
  count  = length(var.microsoft) > 0 ? 1 : 0

  zone_id = cloudflare_zone.this.id

  verification  = var.microsoft.verification
  dmarc_email   = var.microsoft.dmarc_email
  mta_sts_value = var.microsoft.mta_sts_value
}

module "postmark" {
  source = "./modules/postmark"
  count  = length(var.postmark) > 0 ? 1 : 0

  zone_id = cloudflare_zone.this.id

  dmarc_email           = var.postmark.dmarc_email
  dkim_selector         = var.postmark.dkim_selector
  dkim_value            = var.postmark.dkim_value
  dkim_selector_staging = var.postmark.dkim_selector_staging
  dkim_value_staging    = var.postmark.dkim_value_staging
}
