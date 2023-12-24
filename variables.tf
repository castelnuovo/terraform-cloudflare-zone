# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# These variables must be set when using this module.
# ---------------------------------------------------------------------------------------------------------------------

variable "account_id" {
  description = "The account ID where the zone will be placed in."
  type        = string
}

variable "domain" {
  description = "The domain of the zone."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL VARIABLES
# These variables have defaults, but may be overridden.
# ---------------------------------------------------------------------------------------------------------------------

variable "plan" {
  description = "(Optional) The name of the commercial plan to apply to the zone."
  type        = string
  default     = "free"
}

variable "settings_securitylevel" {
  description = "(Optional) The Security Level you choose will determine which visitors will be presented with a challenge page."
  type        = string
  default     = "essentially_off"
}

variable "apple" {
  description = "(Optional) Apple Mail settings"

  type = object({
    verification = string
    dkim_value   = string
    dmarc_email  = string
  })

  #
  # Example:
  #
  # apple = {
  #   verification  = "apple-domain=XXXXXXXX"
  #   dkim_value    = "sig1.dkim.example.com.at.icloudmailadmin.com"
  #   dmarc_email   = "XXXXXXXX@dmarc-reports.cloudflare.net"
  # }
  #

  default = null
}

variable "google" {
  description = "(Optional) Google Workspace settings"

  type = object({
    verification  = string
    dkim_value    = string
    dmarc_email   = string
    mta_sts_value = string
  })

  #
  # Example:
  #
  # google = {
  #   verification  = "google-site-verification="
  #   dkim_value    = "v=DKIM1; k=rsa; p=XXXXXXXX"
  #   dmarc_email   = "XXXXXXXX@dmarc-reports.cloudflare.net"
  #   mta_sts_value = "v=STSv1; id=20230101T000000;"
  # }
  #

  default = null
}


variable "microsoft" {
  description = "(Optional) Microsoft365 settings"

  type = object({
    verification  = string
    dmarc_email   = string
    mta_sts_value = string
  })

  #
  # Example:
  #
  # microsoft = {
  #   verification  = "msXXXXXXXX"
  #   dmarc_email   = "XXXXXXXX@dmarc-reports.cloudflare.net"
  #   mta_sts_value = "v=STSv1; id=20230101T000000;"
  # }
  #

  default = null
}

variable "postmark" {
  description = "(Optional) Postmark settings"

  type = object({
    dmarc_email           = string
    dkim_selector         = string
    dkim_value            = string
    dkim_selector_staging = optional(string, "disabled")
    dkim_value_staging    = optional(string, "disabled")
  })

  #
  # Example:
  #
  # postmark = {
  #   dmarc_email           = "XXXXXXXX@dmarc-reports.cloudflare.net"
  #   dkim_selector         = "XXXXXXXXpm._domainkey"
  #   dkim_value            = "v=DKIM1; k=rsa; p=XXXXXXXX"
  #   dkim_selector_staging = "XXXXXXXXpm._domainkey.staging"
  #   dkim_value_staging    = "v=DKIM1; k=rsa; p=XXXXXXXX"
  # }
  #

  default = null
}
