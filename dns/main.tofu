# DNS Zone Managed Resource
# https://search.opentofu.org/provider/hashicorp/google/latest/docs/resources/dns_managed_zone

locals {
  description = coalesce(var.description, "DNS zone for ${var.dns_name}")
}

resource "google_dns_managed_zone" "this" {
  description = local.description
  dns_name    = var.dns_name
  labels      = var.labels
  name        = var.name
  project     = var.project
  visibility  = var.visibility

  dynamic "dnssec_config" {
    for_each = var.visibility != "public" ? [] : [1]
    content {
      state = "on"
    }
  }

  dynamic "private_visibility_config" {
    for_each = var.visibility != "private" ? [] : length(var.private_visibility_config_networks) == 0 ? [] : [1]
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
