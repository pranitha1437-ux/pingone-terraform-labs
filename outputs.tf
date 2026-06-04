output "population_id" {
  value = pingone_population.employees.id
}

output "saml_app_id" {
  value = pingone_application.saml_app.id
}

output "signing_key_id" {
  value = pingone_key.saml_signing_key.id
}
