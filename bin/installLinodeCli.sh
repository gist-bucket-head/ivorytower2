#!/bin/bash
#add repo
sudo echo "deb http://apt.linode.com/ stable main" > /etc/apt/sources.list.d/linode.list
#get gpg signature
sudo wget -O- https://apt.linode.com/linode.gpg | sudo apt-key add -
#update
sudo apt update
#(re)install linode-cli
sudo apt remove -y linode-cli
sudo apt install -y linode-cli
linode --help
