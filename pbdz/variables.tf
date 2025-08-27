variable "cloudflare_api_token" {
  description = "The Cloudflare API token."
  default     = "changeme"
}

variable "cloudflare_zero_trust_access_domain" {
  description  = "Zero Trust Access Domain"
  default      = "changeme.cloudflareaccess.com"
}

variable "cloudflare_abuse_email" {
  description  = "Primary abuse contact"
  default      = "example@domain.tld"
}

variable "cloudflare_dmarc_email" {
  description  = "Primary DMARC contact"
  default      = "example@domain.tld"
}

variable "joe_pbdz_xyz" {
  description  = "Forwarded e-mail address"
  default      = "example@domain.tld"
}
