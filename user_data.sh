#!/bin/bash
set -euxo pipefail

# Keep package metadata fresh before adding Docker's apt repository.
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release -y
sudo apt install -y unzip curl
sudo apt-get install docker.io -y
sudo apt-get install docker-compose-plugin -y

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install

sudo systemctl enable docker
sudo systemctl start docker

sudo usermod -aG docker ubuntu
