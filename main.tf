terraform {
  required_providers {
    pingone = {
      source  = "pingidentity/pingone"
    }
  }
}

provider "pingone" {
  client_id      = var.client_id
  client_secret  = var.client_secret
  environment_id = var.environment_id
  region_code    = "SG"
}
variable "client_id" {}
variable "client_secret" {}
variable "environment_id" {}

resource "pingone_population" "employees" {
  environment_id = var.environment_id
  name           = "Terraform Employees"
  description    = "Created using Terraform"
}