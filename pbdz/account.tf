resource "cloudflare_account" "master" {
  name = "Pobuda Estates LLC"
  type = "standard"
  settings = {
    abuse_contact_email    = var.email_contacts.abuse
    enforce_twofactor      = false
  }
}
