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
  # verification  = "MS=XXXXXXXX"
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

variable "mta_sts_value" {
  description = "MTA-STS - record value"
  type        = string

  #
  # Example:
  #
  # mta_sts_value  = "v=STSv1; id=20230101T000000;"
  #
}
