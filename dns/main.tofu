# Resources
# https://opentofu.org/docs/language/resources

# DNS Managed Zone Resource
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/dns_managed_zone

resource "google_dns_managed_zone" "this" {
  description = local.description
  dns_name    = var.dns_name
  labels      = var.labels
  name        = var.name
  project     = var.project
  visibility  = var.visibility

  dynamic "dnssec_config" {
    for_each = local.dnssec_config_enabled
    content {
      state = "on"
    }
  }

  dynamic "private_visibility_config" {
    for_each = local.private_visibility_config_enabled
    content {
      dynamic "networks" {
        for_each = var.private_visibility_config_networks
        content {
          network_url = networks.value
        }
      }
    }
  }
}
