#!/bin/bash
sudo apt install ccrypt
rm -rf ~/.linodecli
mkdir -p ~/.linodecli
cp ../sec/config.cpt ~/.linodecli
ccdecrypt -f ~/.linodecli/config.cpt
chmod 600 ~/.linodecli/config
