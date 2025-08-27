resource "cloudflare_account" "master" {
  name = "Pobuda Estates LLC"
  type = "standard"
  settings = {
    abuse_contact_email    = var.cloudflare_abuse_email
    enforce_twofactor      = false
  }
}
