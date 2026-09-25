#!/bin/bash
set -euxo pipefail

# Keep package metadata fresh before adding Docker's apt repository.
apt-get update
apt-get install ca-certificates curl gnupg lsb-release -y
apt install -y unzip curl
apt-get install docker.io -y
apt-get install docker-compose-plugin -y

curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
  -o /tmp/awscliv2.zip

unzip -q /tmp/awscliv2.zip -d /tmp

/tmp/aws/install

# Verify installation
/usr/local/bin/aws --version

systemctl enable docker
systemctl start docker

usermod -aG docker ubuntu
