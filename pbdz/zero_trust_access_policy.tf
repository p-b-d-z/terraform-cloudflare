resource "cloudflare_zero_trust_access_policy" "allow_uptime_kuma" {
  account_id       = cloudflare_account.master.id
  decision         = "non_identity"
  name             = "Allow Uptime Kuma"
  session_duration = "24h"
  exclude          = []
  include = [{
    service_token = {
      token_id = "61d62b0e-05b6-4b1b-afcb-4dd4843cdbfa"
    }
  }]
  require = []
}

resource "cloudflare_zero_trust_access_policy" "allow_public_access" {
  account_id       = cloudflare_account.master.id
  decision         = "bypass"
  name             = "Allow Public Access"
  session_duration = "24h"
  exclude          = []
  include = [{
    everyone = {}
  }]
  require = []
}

resource "cloudflare_zero_trust_access_policy" "permit_pbdz_xyz" {
  account_id       = cloudflare_account.master.id
  decision         = "allow"
  name             = "Permit ${var.hosted_domains.zerotrust}"
  session_duration = "24h"
  exclude          = []
  include = [{
    email_domain = {
      domain = var.hosted_domains.zerotrust
    }
  }]
  require = []
}

resource "cloudflare_zero_trust_access_policy" "permit_google_auth" {
  account_id       = cloudflare_account.master.id
  decision         = "allow"
  name             = "Permit Google Auth"
  session_duration = "24h"
  exclude          = []
  include = [{
    email = {
      email = var.email_contacts.primary
    }
    }, {
    email = {
      email = var.email_contacts.forward
    }
  }]
  require = [{
    login_method = {
      id = cloudflare_zero_trust_access_identity_provider.google_oauth.id
    }
  }]
}

resource "cloudflare_zero_trust_access_policy" "google_auth_vault" {
  account_id       = cloudflare_account.master.id
  decision         = "allow"
  name             = "Google Auth - Vault"
  session_duration = "6h"
  exclude          = []
  include = [{
    email = {
      email = var.email_contacts.primary
    }
    }, {
    email = {
      email = var.email_contacts.estates
    }
    }, {
    email = {
      email = var.email_contacts.alt
    }
  }]
  require = [{
    login_method = {
      id = cloudflare_zero_trust_access_identity_provider.google_oauth.id
    }
    }, {
    geo = {
      country_code = "US"
    }
  }]
}

resource "cloudflare_zero_trust_access_policy" "google_auth_jenkins" {
  account_id       = cloudflare_account.master.id
  decision         = "allow"
  name             = "Google Auth - Jenkins"
  session_duration = "24h"
  exclude          = []
  include = [{
    email = {
      email = var.email_contacts.primary
    }
    }, {
    email_domain = {
      domain = var.hosted_domains.estates
    }
    }, {
    email_domain = {
      domain = var.hosted_domains.zerotrust
    }
  }]
  require = [{
    login_method = {
      id = cloudflare_zero_trust_access_identity_provider.google_oauth.id
    }
    }, {
    geo = {
      country_code = "US"
    }
  }]
}

resource "cloudflare_zero_trust_access_policy" "google_auth_linuxserver" {
  account_id       = cloudflare_account.master.id
  decision         = "allow"
  name             = "Google Auth - Linuxserver"
  session_duration = "24h"
  exclude          = []
  include = [{
    email = {
      email = var.email_contacts.primary
    }
    }, {
    email = {
      email = var.email_contacts.alli
    }
    }, {
    email_domain = {
      domain = var.hosted_domains.estates
    }
    }, {
    email_domain = {
      domain = var.hosted_domains.zerotrust
    }
  }]
  require = [{
    login_method = {
      id = cloudflare_zero_trust_access_identity_provider.google_oauth.id
    }
    }, {
    geo = {
      country_code = "US"
    }
  }]
}
