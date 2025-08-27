resource "cloudflare_zone" "nutanixpro_com" {
  name                = var.hosted_domains.nutanix
  paused              = false
  type                = "full"
  vanity_name_servers = []
  account = {
    id   = cloudflare_account.master.id
    name = cloudflare_account.master.name
  }
}

resource "cloudflare_zone" "pbdz_xyz" {
  name                = var.hosted_domains.zerotrust
  paused              = false
  type                = "full"
  vanity_name_servers = []
  account = {
    id   = cloudflare_account.master.id
    name = cloudflare_account.master.name
  }
}

resource "cloudflare_zone" "pobudz_net" {
  name                = var.hosted_domains.estates
  paused              = false
  type                = "full"
  vanity_name_servers = []
  account = {
    id   = cloudflare_account.master.id
    name = cloudflare_account.master.name
  }
}

resource "cloudflare_zone" "tier3_app" {
  name                = var.hosted_domains.tier3
  paused              = false
  type                = "full"
  vanity_name_servers = []
  account = {
    id   = cloudflare_account.master.id
    name = cloudflare_account.master.name
  }
}

resource "cloudflare_zone" "yetanothermeme_com" {
  name                = var.hosted_domains.meme
  paused              = false
  type                = "full"
  vanity_name_servers = []
  account = {
    id   = cloudflare_account.master.id
    name = cloudflare_account.master.name
  }
}
