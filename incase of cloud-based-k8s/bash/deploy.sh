#!/bin/bash

# Install Docker
curl -fsSL https://get.docker.com | sh

# Disable swap
sudo swapoff -a

# Install dependencies for Kubernetes
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl

# Add Kubernetes apt repository key
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

# Add Kubernetes apt repository
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update package cache
sudo apt-get update -o Acquire::AllowInsecureRepositories=true

# Install Kubernetes components
sudo apt-get install -y --allow-change-held-packages --allow-unauthenticated kubelet kubeadm kubectl

# Prevent automatic updates of Kubernetes packages
sudo apt-mark hold kubelet kubeadm kubectl