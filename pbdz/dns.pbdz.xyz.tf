resource "cloudflare_dns_record" "pbdz_xyz_dmarc" {
  content  = "v=DMARC1; p=reject; rua=mailto:${cloudflare_dmarc_email}"
  name     = "_dmarc.pbdz.xyz"
  proxied  = false
  tags     = []
  ttl      = 1
  type     = "TXT"
  zone_id  = cloudflare_zone.pbdz_xyz.id
  settings = {}
}

resource "cloudflare_dns_record" "pbdz_xyz_spf" {
  content  = "v=spf1 include:_spf.mx.cloudflare.net -all"
  name     = "pbdz.xyz"
  proxied  = false
  tags     = []
  ttl      = 1
  type     = "TXT"
  zone_id  = cloudflare_zone.pbdz_xyz.id
  settings = {}
}

resource "cloudflare_dns_record" "pbdz_xyz_mx_tertiary" {
  content  = "route3.mx.cloudflare.net"
  name     = "pbdz.xyz"
  priority = 20
  proxied  = false
  tags     = []
  ttl      = 1
  type     = "MX"
  zone_id  = cloudflare_zone.pbdz_xyz.id
  settings = {}
}

resource "cloudflare_dns_record" "pbdz_xyz_mx_secondary" {
  content  = "route2.mx.cloudflare.net"
  name     = "pbdz.xyz"
  priority = 10
  proxied  = false
  tags     = []
  ttl      = 1
  type     = "MX"
  zone_id  = cloudflare_zone.pbdz_xyz.id
  settings = {}
}

resource "cloudflare_dns_record" "pbdz_xyz_mx_primary" {
  content  = "route1.mx.cloudflare.net"
  name     = "pbdz.xyz"
  priority = 0
  proxied  = false
  tags     = []
  ttl      = 1
  type     = "MX"
  zone_id  = cloudflare_zone.pbdz_xyz.id
  settings = {}
}
