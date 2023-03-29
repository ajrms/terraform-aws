#!/bin/bash

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

sleep 3

curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

sleep 3

echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sleep 2

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sleep 3

kubectl version
sleep 1

apt-get -y install unzip

sleep 25

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

sleep 4

unzip awscliv2.zip

sleep 5

./aws/install

sleep 3