#!/bin/bash

user=vagrant
IP=$(ip a | grep 192. | awk '{print $2}' | awk -F"/" '{print $1}')
sudo kubeadm init --apiserver-advertise-address=$IP

mkdir -p /home/$user/.kube
yes | sudo cp -rf /etc/kubernetes/admin.conf /home/$user/.kube/config
sudo chown $user:$user /home/$user/.kube/config

kubeadm token create --print-join-command > /vagrant/worker.sh