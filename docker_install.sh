#!/bin/bash

sudo apt-get update
sleep 10

sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sleep 1

sudo mkdir -m 0755 -p /etc/apt/keyrings
sleep 1

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sleep 1

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sleep 1

sudo apt-get update
sleep 10

sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin