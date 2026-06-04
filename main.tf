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
resource "pingone_key" "saml_signing_key" {
  environment_id      = var.environment_id
  name                = "Terraform SAML Key"
  algorithm           = "RSA"
  key_length          = 2048
  signature_algorithm = "SHA256withRSA"
  subject_dn          = "CN=Terraform SAML Key,O=Example,C=SG"
  usage_type          = "SIGNING"
  validity_period     = 365
}

resource "pingone_application" "saml_app" {
  environment_id = var.environment_id

  name    = "Terraform SAML App"
  enabled = true

  saml_options = {
    acs_urls           = ["https://example.com/saml/acs"]
    assertion_duration = 3600
    sp_entity_id       = "https://example.com/sp"

    idp_signing_key = {
      key_id    = pingone_key.saml_signing_key.id
      algorithm = "SHA256withRSA"
    }
  }
}