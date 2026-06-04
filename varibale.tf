variable "client_id" {
  description = "PingOne Client ID"
  type        = string
}

variable "client_secret" {
  description = "PingOne Client Secret"
  type        = string
  sensitive   = true
}

variable "environment_id" {
  description = "PingOne Environment ID"
  type        = string
}
