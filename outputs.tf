# ------------------------------------------------------------------------------
# OUTPUT ALL INPUT VARIABLES
# ------------------------------------------------------------------------------

output "domain" {
  description = "The domain of the zone."
  value       = var.domain
}

# ------------------------------------------------------------------------------
# OUTPUT MODULE CONFIGURATION
# ------------------------------------------------------------------------------

output "id" {
  description = "The id of the zone."
  value       = cloudflare_zone.this.id
}
