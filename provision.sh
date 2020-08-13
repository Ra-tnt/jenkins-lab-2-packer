#!/bin/bash
sudo apt update -y && sudo apt install -y curl vim jq git make docker.io
sudo usermod -aG docker ubuntu
sudo apt-get update
sudo apt-get install -y nginx
sudo service nginx start
echo "done."
