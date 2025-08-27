#!/bin/bash
cd cf-terraforming
git pull https://github.com/cloudflare/cf-terraforming.git
go build -o cf-terraforming ./cmd/cf-terraforming
./cf-terraforming version
sudo cp cf-terraforming /usr/local/bin/
which cf-terraforming
