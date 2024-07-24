#!/bin/bash

# clear build artefacts
rm ./binaries/*

# detect system architecture
# arch=$(uname -m)

# manually define architecture
arch="x86_64" # arm64 or x86_64

if [[ "$arch" == "arm64" ]]; then
  echo "arm64"
  curl -L https://github.com/krallin/tini/releases/download/v0.19.0/tini-arm64 -o binaries/tini
  curl -L https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.arm -o binaries/ttyd
  curl -L https://github.com/derailed/k9s/releases/download/v0.32.5/k9s_Linux_arm64.tar.gz | tar -xz -C ./binaries k9s
  curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl" -o binaries/kubectl
  docker build --platform linux/arm64 -t webterm .
elif [[ "$arch" == "x86_64" ]]; then
  echo "x86_64"
  curl -L https://github.com/krallin/tini/releases/download/v0.19.0/tini-amd64 -o binaries/tini
  curl -L https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 -o binaries/ttyd
  curl -L https://github.com/derailed/k9s/releases/download/v0.32.5/k9s_Linux_amd64.tar.gz | tar -xz -C ./binaries k9s
  curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o binaries/kubectl
  docker build --platform linux/amd64 -t webterm .
fi
