#!/bin/sh
curl -fsSL https://get.docker.com/ | sh
systemctl start docker
systemctl enable docker
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x kubectl
mv kubectl /usr/local/bin/
usermod -aG docker $USER && newgrp docker
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.17.0/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/local/bin/kind
curl -O https://raw.githubusercontent.com/allenov/k8s-learn/main/kind-config.yaml
kind create cluster --config kind-config.yaml
