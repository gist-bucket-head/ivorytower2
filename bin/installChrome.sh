#!/bin/bash
#http://askubuntu.com/questions/79280/how-to-install-chrome-browser-properly-via-command-line
sudo apt install -y libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
sudo apt install -f -y
sudo dpkg -i google-chrome*.deb
rm -rf google-chrome-stable_current_amd64.deb*
google-chrome &
