#!/bin/bash
sudo apt install -y lamp-server^
sudo rm -rf /var/www/html/index.html
sudo cp ~/ivorytowers/html/index.html /var/www/html
firefox localhost:80 &
