#!/bin/sh
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE
sudo add-apt-repository 'deb https://typora.io linux/'
sudo apt update && sudo apt install typora
sudo apt -f -y install
sudo apt update && sudo apt install typora
sudo apt install -y libnss3-dev
typora &