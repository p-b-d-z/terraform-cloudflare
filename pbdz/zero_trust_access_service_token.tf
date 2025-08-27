resource "cloudflare_zero_trust_access_service_token" "pbdz_xyz_uptime_kuma" {
  duration = "87600h"
  name     = "Uptime Kuma"
  zone_id  = cloudflare_zone.pbdz_xyz.id
}
