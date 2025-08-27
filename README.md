# Terraform - Cloudflare

## Getting Started

I'm constructing this repository to support multiple accounts (monolith) for my own personal laziness. Feel free to fork and use as desired.

### Install Terraform

Run the script to install Terraform, if it is not already installed.
```bash
sudo ./install-terraform.sh
```

Download and install `cf-terraforming` from https://github.com/cloudflare/cf-terraforming or run the script included in this repository.
```bash
sudo ./build-terraforming.sh
```

### Generate and Import

Run the `generate-cf.sh` script against the account directory.
```bash
sudo ./generate-cf.sh [account sub-directory]
```

This will create a generate.raw file that contains all of the resources to import.
- Extract the resources and organize into files (*.tf)
- Extract sensitive/repetitive information and organize into variable files (variables.tf, *.auto.tfvars)
- Run the cf-terraforming import command to generate the import configuration (*.import.tf)
- Rename the imported resources by matching UUIDs (defaults to terraform_managed_resource_[ID]_#)

### Deploying

Ideally when running through the plan after import for the first time, there are no adds/removes and only minor changes.

Initialize the directory
```bash
cd [account sub-directory]
terraform init
```

Validate the Terraform plan
```bash
terraform plan -out current.plan
```

Apply the Terraform plan
```bash
terraform apply current.plan
```

## Troubleshooting
You may need to modify some state manually. For example, the `cloudflare_account` "type" resource cannot be modified or imported (bug?). You may need to manually add the type attribute. To do this, following these steps:
```bash
terraform state pull > current.state
cp current.state new.state
# Edit the state
nano new.state
terraform state push new.state
```
