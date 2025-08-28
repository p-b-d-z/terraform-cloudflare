#!/bin/bash

PROJECT=$1
RESOURCES=(
  'cloudflare_account'
  'cloudflare_account_member'
  'cloudflare_account_subscription'
  'cloudflare_address_map'
  'cloudflare_dns_record'
  'cloudflare_email_routing_address'
  'cloudflare_email_routing_catch_all'
  'cloudflare_email_routing_dns'
  'cloudflare_email_routing_rule'
  'cloudflare_email_routing_settings'
  'cloudflare_zero_trust_access_application'
  'cloudflare_zero_trust_access_group'
  'cloudflare_zero_trust_access_identity_provider'
  'cloudflare_zero_trust_access_infrastructure_target'
  'cloudflare_zero_trust_access_key_configuration'
  'cloudflare_zero_trust_access_policy'
  'cloudflare_zero_trust_access_service_token'
  'cloudflare_zero_trust_access_tag'
  'cloudflare_zero_trust_device_custom_profile'
  'cloudflare_zero_trust_device_default_profile'
  'cloudflare_zero_trust_device_default_profile_certificates'
  'cloudflare_zero_trust_device_default_profile_local_domain_fallback'
  'cloudflare_zero_trust_device_managed_networks'
  'cloudflare_zero_trust_device_posture_integration'
  'cloudflare_zero_trust_device_posture_rule'
  'cloudflare_zero_trust_gateway_policy'
  'cloudflare_zero_trust_gateway_proxy_endpoint'
  'cloudflare_zero_trust_gateway_settings'
  'cloudflare_zero_trust_list'
  'cloudflare_zero_trust_organization'
  'cloudflare_zero_trust_tunnel_cloudflared'
  'cloudflare_zero_trust_tunnel_cloudflared_config'
  'cloudflare_zero_trust_tunnel_cloudflared_route'
  'cloudflare_zero_trust_tunnel_cloudflared_virtual_network'
  'cloudflare_zone'
  'cloudflare_zone_dnssec'
  'cloudflare_zone_setting'
)

cd $PROJECT
source .env
for i in "${!RESOURCES[@]}"; do
  echo -e "\nProcessing ${RESOURCES[$i]} for Zone: ${ZONE_ID}"
  cf-terraforming generate --zone ${ZONE_ID} --resource-type "${RESOURCES[$i]}" --terraform-binary-path=./terraform >> generate.raw
  echo -e "\nProcessing ${RESOURCES[$i]} for Account: ${ACCOUNT_ID}"
  cf-terraforming generate --account ${ACCOUNT_ID} --resource-type "${RESOURCES[$i]}" --terraform-binary-path=./terraform >> generate.raw
done
