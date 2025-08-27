resource "cloudflare_zero_trust_access_application" "jenkins_pbdz_xyz" {
  allowed_idps               = []
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "jenkins.${var.hosted_domains.zerotrust}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Jenkins"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "jenkins.${var.hosted_domains.zerotrust}"
  }]
  session_duration           = "24h"
  tags                       = []
  type                       = "self_hosted"
  zone_id                    = cloudflare_zone.pbdz_xyz.id
  policies = [{
    id         = cloudflare_zero_trust_access_policy.allow_uptime_kuma.id
    precedence = 1
    }, {
    id         = cloudflare_zero_trust_access_policy.google_auth_jenkins.id
    precedence = 2
  }]
}

resource "cloudflare_zero_trust_access_application" "sabnzbd_pbdz_xyz" {
  allowed_idps               = ["424eba98-23bd-49c1-b835-0678dacb99a9"]
  app_launcher_visible       = true
  auto_redirect_to_identity  = true
  domain                     = "sabnzbd.${var.hosted_domains.zerotrust}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Sabnzbd"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "sabnzbd.${var.hosted_domains.zerotrust}"
  }]
  session_duration           = "24h"
  tags                       = []
  type                       = "self_hosted"
  zone_id                    = cloudflare_zone.pbdz_xyz.id
  policies = [{
    id               = cloudflare_zero_trust_access_policy.allow_uptime_kuma.id
    precedence       = 1
    }, {
    id               = cloudflare_zero_trust_access_policy.google_auth_linuxserver.id
    precedence = 2
  }]
}

resource "cloudflare_zero_trust_access_application" "radarr_pbdz_xyz" {
  allowed_idps               = ["424eba98-23bd-49c1-b835-0678dacb99a9"]
  app_launcher_visible       = true
  auto_redirect_to_identity  = true
  domain                     = "radarr.${var.hosted_domains.zerotrust}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Radarr"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "radarr.${var.hosted_domains.zerotrust}"
  }]
  session_duration           = "24h"
  tags                       = []
  type                       = "self_hosted"
  zone_id                    = cloudflare_zone.pbdz_xyz.id
  policies = [{
    id         = cloudflare_zero_trust_access_policy.allow_uptime_kuma.id
    precedence = 1
    }, {
    id         = cloudflare_zero_trust_access_policy.google_auth_linuxserver.id
    precedence = 2
  }]
}

resource "cloudflare_zero_trust_access_application" "sonarr_pbdz_xyz" {
  allowed_idps               = ["424eba98-23bd-49c1-b835-0678dacb99a9"]
  app_launcher_visible       = true
  auto_redirect_to_identity  = true
  domain                     = "sonarr.${var.hosted_domains.zerotrust}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Sonarr"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "sonarr.${var.hosted_domains.zerotrust}"
  }]
  session_duration           = "24h"
  tags                       = []
  type                       = "self_hosted"
  zone_id                    = cloudflare_zone.pbdz_xyz.id
  policies = [{
    id               = cloudflare_zero_trust_access_policy.allow_uptime_kuma.id
    precedence       = 1
    }, {
    id               = cloudflare_zero_trust_access_policy.google_auth_linuxserver.id
    precedence       = 2
  }]
}

resource "cloudflare_zero_trust_access_application" "vault_pbdz_xyz" {
  allowed_idps               = ["424eba98-23bd-49c1-b835-0678dacb99a9"]
  app_launcher_visible       = true
  auto_redirect_to_identity  = true
  domain                     = "vault.${var.hosted_domains.zerotrust}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Vault"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "vault.${var.hosted_domains.zerotrust}"
  }]
  session_duration           = "24h"
  tags                       = []
  type                       = "self_hosted"
  zone_id                    = cloudflare_zone.pbdz_xyz.id
  policies = [{
    id               = cloudflare_zero_trust_access_policy.allow_uptime_kuma.id
    precedence       = 1
    }, {
    id               = cloudflare_zero_trust_access_policy.google_auth_vault.id
    precedence       = 2
  }]
}

resource "cloudflare_zero_trust_access_application" "teslamate_pbdz_xyz" {
  allowed_idps               = ["424eba98-23bd-49c1-b835-0678dacb99a9"]
  app_launcher_visible       = true
  auto_redirect_to_identity  = true
  domain                     = "teslamate.${var.hosted_domains.zerotrust}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Teslamate"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "teslamate.${var.hosted_domains.zerotrust}"
  },{
    type = "public"
    uri  = "tesladash.${var.hosted_domains.zerotrust}"
  }]
  session_duration           = "24h"
  tags                       = []
  type                       = "self_hosted"
  zone_id                    = cloudflare_zone.pbdz_xyz.id
  policies = [{
    id               = cloudflare_zero_trust_access_policy.allow_uptime_kuma.id
    precedence       = 1
  },{
    id               = cloudflare_zero_trust_access_policy.google_auth_linuxserver.id
    precedence       = 2
  }]
}

resource "cloudflare_zero_trust_access_application" "uptime_pbdz_xyz" {
  allowed_idps               = ["424eba98-23bd-49c1-b835-0678dacb99a9"]
  app_launcher_visible       = true
  auto_redirect_to_identity  = true
  domain                     = "uptime.${var.hosted_domains.zerotrust}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Uptime Kuma"
  options_preflight_bypass   = false
  same_site_cookie_attribute = "none"
  destinations = [{
    type = "public"
    uri  = "uptime.${var.hosted_domains.zerotrust}"
  }]
  session_duration           = "24h"
  tags                       = []
  type                       = "self_hosted"
  zone_id                    = cloudflare_zone.pbdz_xyz.id
  policies = [{
    id               = cloudflare_zero_trust_access_policy.allow_uptime_kuma.id
    precedence       = 1
  },{
    id               = cloudflare_zero_trust_access_policy.permit_google_auth.id
    precedence       = 2
  }]
}

resource "cloudflare_zero_trust_access_application" "pwpusher_pbdz_xyz" {
  allowed_idps               = []
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "pwpusher.${var.hosted_domains.zerotrust}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Password Pusher - pbdz.xyz"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "pwpusher.${var.hosted_domains.zerotrust}"
  }]
  session_duration           = "24h"
  tags                       = []
  type                       = "self_hosted"
  zone_id                    = cloudflare_zone.pbdz_xyz.id
  policies = [{
    id               = cloudflare_zero_trust_access_policy.allow_public_access.id
    precedence       = 1
  }]
}

resource "cloudflare_zero_trust_access_application" "ssh3_pbdz_xyz" {
  allowed_idps               = ["424eba98-23bd-49c1-b835-0678dacb99a9"]
  app_launcher_visible       = true
  auto_redirect_to_identity  = true
  domain                     = "ssh3.${var.hosted_domains.zerotrust}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "SSH - NUC"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "ssh3.${var.hosted_domains.zerotrust}"
  }]
  session_duration           = "24h"
  skip_interstitial          = true
  tags                       = []
  type                       = "ssh"
  zone_id                    = cloudflare_zone.pbdz_xyz.id
  policies = [{
    id         = cloudflare_zero_trust_access_policy.permit_google_auth.id
    precedence = 1
  }]
}

resource "cloudflare_zero_trust_access_application" "ssh2_pbdz_xyz" {
  allowed_idps               = ["424eba98-23bd-49c1-b835-0678dacb99a9"]
  app_launcher_visible       = true
  auto_redirect_to_identity  = true
  domain                     = "ssh2.${var.hosted_domains.zerotrust}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "SSH - DNS2"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "ssh2.${var.hosted_domains.zerotrust}"
  }]
  session_duration           = "24h"
  skip_interstitial          = true
  tags                       = []
  type                       = "ssh"
  zone_id                    = cloudflare_zone.pbdz_xyz.id
  policies = [{
    id         = cloudflare_zero_trust_access_policy.permit_google_auth.id
    precedence = 1
  }]
}

resource "cloudflare_zero_trust_access_application" "ssh1_pbdz_xyz" {
  allowed_idps               = ["424eba98-23bd-49c1-b835-0678dacb99a9"]
  app_launcher_visible       = true
  auto_redirect_to_identity  = true
  domain                     = "ssh1.${var.hosted_domains.zerotrust}"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "SSH - DNS1"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "ssh1.${var.hosted_domains.zerotrust}"
  }]
  session_duration           = "24h"
  skip_interstitial          = true
  tags                       = []
  type                       = "ssh"
  zone_id                    = cloudflare_zone.pbdz_xyz.id
  policies = [{
    id         = cloudflare_zero_trust_access_policy.permit_google_auth.id
    precedence = 1
  }]
}
