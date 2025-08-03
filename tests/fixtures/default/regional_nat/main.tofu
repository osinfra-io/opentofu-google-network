# Required Providers
# https://opentofu.org/docs/language/providers/requirements

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

module "all_subnets_test" {
  source = "../../../../regional/nat"

  network = "mock-vpc"
  project = var.project
}

module "list_of_subnets_test" {
  source = "../../../../regional/nat"

  network                            = "mock-vpc"
  prefix                             = "mock-vpc-subnetworks"
  project                            = var.project
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork_names                   = ["mock-subnetwork"]
}
