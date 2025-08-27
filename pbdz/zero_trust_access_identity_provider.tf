resource "cloudflare_zero_trust_access_identity_provider" "onetimepin" {
  name       = "onetimepin"
  type       = "onetimepin"
  account_id = cloudflare_account.master.id
  config     = {}
}

resource "cloudflare_zero_trust_access_identity_provider" "google_oauth" {
  name        = "Google"
  type        = "google"
  account_id  = cloudflare_account.master.id
  config      = {
    client_id = var.google_oauth_client_id
  }
  scim_config = {
    enabled                  = false
    group_member_deprovision = false
    identity_update_behavior = "no_action"
    seat_deprovision         = false
    user_deprovision         = false
  }
}

resource "cloudflare_zero_trust_organization" "pbdz" {
  allow_authenticate_via_warp = false
  auth_domain                 = var.cloudflare_zero_trust_access_domain
  is_ui_read_only             = false
  name                        = var.cloudflare_zero_trust_access_domain
  warp_auth_session_duration  = "24h"
  account_id                  = cloudflare_account.master.id
  login_design                = {}
}
