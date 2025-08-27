variable "cloudflare_api_token" {
  description = "The Cloudflare API token."
  default     = "changeme"
}

variable "cloudflare_zero_trust_access_domain" {
  description  = "Zero Trust Access Domain"
  default      = "changeme.cloudflareaccess.com"
}

variable "hosted_domains" {
  description = "Domain dictionary"
  type        = map(string)
  default = {
    primary   = "some.com"
  }
}

variable "email_contacts" {
  description = "Email address dictionary"
  type        = map(string)
  default = {
    primary   = "some@email.com"
  }
}
