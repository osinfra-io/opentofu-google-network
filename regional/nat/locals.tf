# Local Values
# https://www.terraform.io/docs/language/values/locals.html

locals {
  name   = "${local.prefix}-${module.helpers.region}"
  prefix = var.prefix == "" ? var.network : var.prefix
}
