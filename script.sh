#!/bin/bash

##K8S
sudo apt update && sudo apt upgrade -y
sudo mkdir /etc/apt/keyrings/
sudo curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl telnet net-tools vim containerd
sudo systemctl enable containerd && sudo systemctl start containerd
sudo apt install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
sudo modprobe br_netfilter
sudo sed -i '/net.ipv4.ip_forward/ s/#//g' /etc/sysctl.conf
sudo sysctl -p