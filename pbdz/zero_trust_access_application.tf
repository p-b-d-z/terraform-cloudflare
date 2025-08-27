resource "cloudflare_zero_trust_access_application" "jenkins_pbdz_xyz" {
  allowed_idps               = []
  app_launcher_visible       = true
  auto_redirect_to_identity  = false
  domain                     = "jenkins.pbdz.xyz"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Jenkins"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "jenkins.pbdz.xyz"
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
  domain                     = "sabnzbd.pbdz.xyz"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Sabnzbd"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "sabnzbd.pbdz.xyz"
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
  domain                     = "radarr.pbdz.xyz"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Radarr"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "radarr.pbdz.xyz"
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
  domain                     = "sonarr.pbdz.xyz"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Sonarr"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "sonarr.pbdz.xyz"
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
  domain                     = "vault.pbdz.xyz"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Vault"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "vault.pbdz.xyz"
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
  domain                     = "teslamate.pbdz.xyz"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Teslamate"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "teslamate.pbdz.xyz"
  },{
    type = "public"
    uri  = "tesladash.pbdz.xyz"
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
  domain                     = "uptime.pbdz.xyz"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Uptime Kuma"
  options_preflight_bypass   = false
  same_site_cookie_attribute = "none"
  destinations = [{
    type = "public"
    uri  = "uptime.pbdz.xyz"
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
  domain                     = "pwpusher.pbdz.xyz"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "Password Pusher - pbdz.xyz"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "pwpusher.pbdz.xyz"
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
  domain                     = "ssh3.pbdz.xyz"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "SSH - NUC"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "ssh3.pbdz.xyz"
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
  domain                     = "ssh2.pbdz.xyz"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "SSH - DNS2"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "ssh2.pbdz.xyz"
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
  domain                     = "ssh1.pbdz.xyz"
  enable_binding_cookie      = false
  http_only_cookie_attribute = false
  name                       = "SSH - DNS1"
  options_preflight_bypass   = false
  destinations = [{
    type = "public"
    uri  = "ssh1.pbdz.xyz"
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
