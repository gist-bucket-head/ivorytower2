#!/bin/bash
SUDO_PERMISSIONS=$1
NEW_USER=$2
NEW_PASS=$3
TEMP_PASSWORD=$NEW_PASS
TEMP_ENCRYPTED_PASSWORD=`perl -e 'printf("%s\n", crypt($ARGV[0], "password"))' "$TEMP_PASSWORD"`
if [ $SUDO_PERMISSIONS == 1 ]; then
useradd -m -p $TEMP_ENCRYPTED_PASSWORD -s /bin/bash $NEW_USER -G sudo
sudo bash -c 'echo "'$NEW_USER' ALL=(ALL:ALL) ALL" | (EDITOR="tee -a" visudo)'
else
useradd -m -p $TEMP_ENCRYPTED_PASSWORD -s /bin/bash $NEW_USER
fi
sudo -H -u $NEW_USER bash -c 'echo xfce4-session >~/.xsession'
