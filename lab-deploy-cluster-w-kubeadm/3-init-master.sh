#!/usr/bin/env bash

kubeadm init \
  --apiserver-advertise-address=$(hostname -i) \
  --apiserver-cert-extra-sans=controlplane \
  --pod-network-cidr=172.17.0.0/16\
  --service-cidr=172.20.0.0/16