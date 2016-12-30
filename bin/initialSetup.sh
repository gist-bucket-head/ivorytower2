#!/bin/bash
echo 'Acquire::ForceIPv4 "true";' | sudo tee /etc/apt/apt.conf.d/99force-ipv4;
apt -y update
apt list --upgradable
apt -y upgrade
sudo apt-get install -y xauth x11-apps firefox xrdp xfce4 rdesktop
sed -i 's/\. \/etc\/X11\/Xsession/startxfce4/g' /etc/xrdp/startwm.sh
sed -i 's/# HOME=\/home/HOME=\/home/g' /etc/default/useradd
lsb_release -a
