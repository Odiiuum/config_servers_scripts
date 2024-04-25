#!/bin/bash

apt update
apt install apt-transport-https ca-certificates curl software-properties-common gnupg -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update

apt install docker-ce -y

latest_version=$(curl -s "https://api.github.com/repos/docker/compose/releases/latest" | jq -r '.tag_name')

curl -L "https://github.com/docker/compose/releases/download/$latest_version/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

docker compose version