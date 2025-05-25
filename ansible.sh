#!/bin/bash
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt -y install ansible 
sudo apt -y install git
sudo git clone -b ansible 