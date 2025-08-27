resource "cloudflare_email_routing_rule" "forward_to_pobudz_gmail" {
  enabled  = true
  name     = "Rule created at 2022-05-01T06:05:07.477Z"
  priority = 0
  zone_id  = cloudflare_zone.pbdz_xyz.id
  actions = [{
    type  = "forward"
    value = [var.email_contacts.primary]
  }]
  matchers = [{
    field = "to"
    type  = "literal"
    value = var.email_contacts.forward
  }]
}

resource "cloudflare_email_routing_settings" "terraform_managed_resource_5e39558b5935c9c22b71a24b248b7a0a_0" {
  zone_id = cloudflare_zone.pbdz_xyz.id
}
