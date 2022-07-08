#!/bin/bash
# Purpose: Kubernetes Cluster
# https://hub.docker.com/r/kindest/node/tags
# https://hub.docker.com/r/kindest/node
# https://hub.docker.com/u/kindest
# https://hub.docker.com/r/kindest/node/tags

####################
# Docker Installtion
####################
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
rm -f get-docker.sh

#######################
# Kubectl Installation
#######################
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
kubectl version --client

####################
# Helm Installation
####################
# https://helm.sh/docs/intro/install/

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
cp /usr/local/bin/helm /usr/bin/helm
rm -f get_helm.sh
helm version

###################
# Kind Installation
###################

 curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.0/kind-linux-amd64

# Latest Version
# https://github.com/kubernetes-sigs/kind
# curl -Lo ./kind "https://kind.sigs.k8s.io/dl/v0.9.0/kind-$(uname)-amd64"
# curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.9.0/kind-linux-amd64
# curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.8.1/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/local/bin


# kind create cluster --name cloudgeeks-ca

kind create cluster --name cloudgeeks-ca --image kindest/node:v1.21.10

# kind create cluster --name cloudgeeks-ca --image kindest/node:v1.20.7

# kind create cluster --name cloudgeeks-ca --image kindest/node:v1.19.0

# kind create cluster --name cloudgeeks-ca --image kindest/node:v1.18.8

# kind create cluster --name cloudgeeks-ca --image kindest/node:v1.18.6

# kubectl cluster-info

# End