# Local Values
# https://opentofu.org/docs/language/values/locals

locals {
  log_config_enabled = var.purpose != "INTERNAL_HTTPS_LOAD_BALANCER" ? [0] : []
}
