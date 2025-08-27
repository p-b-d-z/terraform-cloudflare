resource "cloudflare_zero_trust_access_group" "pbdz_xyz_domain" {
  is_default = true
  name       = "Family"
  zone_id    = cloudflare_zone.pbdz_xyz.id
  exclude    = []
  include = [{
    email_domain = {
      domain = "pbdz.xyz"
    }
  }]
  require = []
}
