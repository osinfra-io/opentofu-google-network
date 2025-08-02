# Local Values
# https://opentofu.org/docs/language/values/locals

locals {
  name   = "${local.prefix}-${module.helpers.region}"
  prefix = var.prefix == "" ? var.network : var.prefix
}
