# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED VARIABLES
# These variables must be set when using this submodule.
# ---------------------------------------------------------------------------------------------------------------------

variable "zone_id" {
  description = "The id of the zone."
  type        = string
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

variable "dkim_selector" {
  description = "DKIM selector"
  type        = string

  #
  # Example:
  #
  # dkim_selector  = "XXXXXXXXpm._domainkey"
  #
}

variable "dkim_value" {
  description = "DKIM value - XXXXXXXXpm._domainkey"
  type        = string

  #
  # Example:
  #
  # dkim_value  = "v=DKIM1; k=rsa; p=XXXXXXXX"
  #
}

variable "dkim_selector_staging" {
  description = "DKIM selector (staging)"
  type        = string

  #
  # Example:
  #
  # dkim_selector_staging  = "XXXXXXXXpm._domainkey.staging"
  #

  default = null
}

variable "dkim_value_staging" {
  description = "DKIM value (staging) - XXXXXXXXpm._domainkey.staging"
  type        = string

  #
  # Example:
  #
  # dkim_value_staging  = "v=DKIM1; k=rsa; p=XXXXXXXX"
  #

  default = null
}
