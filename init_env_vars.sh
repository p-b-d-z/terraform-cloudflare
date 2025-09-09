#!/bin/bash
# Jenkins CI/CD pipeline uses the same AWS SSM Parameters for authorization
# This script will write the SSM parameters to cloudflare.auto.tfvars for local development.
function check_auth() {
    if ! aws sts get-caller-identity --profile $AWS_DEFAULT_PROFILE > /dev/null 2>&1; then
        printf '\n[ERR] Cannot Authenticate with AWS using %s, please authenticate and try again' "$AWS_DEFAULT_PROFILE"
        printf '\nRunning aws sso login --profile %s\n\n' "$AWS_DEFAULT_PROFILE"
        aws sso login --profile $AWS_DEFAULT_PROFILE
    fi
}

export AWS_DEFAULT_PROFILE=my-aws-account
export AWS_REGION=us-west-2

check_auth

readarray -t dirs < <(find . -mindepth 1 -maxdepth 1 -type d ! -name '.*' -printf '%f\n')
# Value from /all/cloudflare/[account]/cloudflare_api_token
for dir in "${dirs[@]}"; do
  echo "Saving ${dir} credentials to file: ./${dir}/cloudflare.auto.tfvars"
  ssm_path="/all/cloudflare/${dir}/cloudflare_api_token"
  CLOUDFLARE_API_TOKEN=$(aws ssm get-parameter --name ${ssm_path} --with-decryption --profile $AWS_DEFAULT_PROFILE | jq --raw-output '.Parameter.Value')
  echo "# Credentials retrieved from AWS SSM" > ./${dir}/cloudflare.auto.tfvars
  echo "# Source account: ${AWS_DEFAULT_PROFILE}" >> ./${dir}/cloudflare.auto.tfvars
  echo "# Source region: ${AWS_REGION}" >> ./${dir}/cloudflare.auto.tfvars
  echo "cloudflare_api_token=\"${CLOUDFLARE_API_TOKEN}\"" >> ./${dir}/cloudflare.auto.tfvars
done
