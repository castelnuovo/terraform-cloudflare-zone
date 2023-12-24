# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# These variables must be set when using this submodule.
# ---------------------------------------------------------------------------------------------------------------------

variable "zone_id" {
  description = "The id of the zone."
  type        = string
}

variable "verification" {
  description = "The verification record value."
  type        = string

  #
  # Example:
  #
  # verification  = "apple-domain=XXXXXXXX"
  #
}

variable "dkim_value" {
  description = "DKIM value - sig1._domainkey"
  type        = string

  #
  # Example:
  #
  # dkim_value  = "sig1.dkim.example.com.at.icloudmailadmin.com"
  #
}

variable "dmarc_email" {
  description = "DMARC - reporting 'rua=' email address"
  type        = string

  #
  # Example:
  #
  # dmarc_email  = "XXXXXXXX@dmarc-reports.cloudflare.net"
  #
}
