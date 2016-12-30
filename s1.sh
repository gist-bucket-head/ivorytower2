#!/bin/bash
#On Ubuntu 16.04 LTS acting as root

#smart thing to do first
apt-get update

#uninstall/install zip and unzip
apt remove -y zip unzip
apt install -y zip unzip

#install git with no prompts
apt remove -y git
apt install -y git

#install some good encryption/decryption stuff
apt remove -y ccrypt
apt install -y ccrypt

#https://www.linode.com/docs/platform/linode-cli

#add repo
echo "deb http://apt.linode.com/ stable main" > /etc/apt/sources.list.d/linode.list
#get the gpg key
wget -O- https://apt.linode.com/linode.gpg | sudo apt-key add -
#update with the repo there
apt-get update
#install the cli
sudo apt-get remove -y linode-cli
sudo apt-get install -y linode-cli

rm -rf master.zip
rm -rf ivorytowers-master
wget https://github.com/gist-bucket-head/ivorytowers/archive/master.zip
unzip master.zip

rm -rf ~/.linodecli
mkdir -p ~/.linodecli
cp ivorytowers-master/sec/config.cpt ~/.linodecli
ccdecrypt -f ~/.linodecli/config.cpt
chmod 600 ~/.linodecli/config

rm -rf ~/.sec
mkdir -p ~/.sec
cp ivorytowers-master/sec/gitconfig.sh.cpt ~/.sec
ccdecrypt -f ~/.sec/gitconfig.sh.cpt

bash ~/.sec/gitconfig.sh

#get repo
rm -rf ivorytowers
git clone https://github.com/gist-bucket-head/ivorytowers.git

#install python dev tools and pip and awscli, all one-way
#NOT IDEMPOTENT!
#also, there are wasy to install without root/sudo
#see: http://docs.aws.amazon.com/cli/latest/userguide/installing.html
apt-get install -y python-setuptools python-dev build-essential
easy_install pip
pip install awscli --ignore-installed six

rm -rf ~/.aws
mkdir -p ~/.aws
chmod 755 ~/.aws
cp ivorytowers-master/sec/awsconfig.cpt ~/.aws
ccdecrypt -f ~/.aws/awsconfig.cpt
mv ~/.aws/awsconfig ~/.aws/config
chmod 600 ~/.aws/config
cp ivorytowers-master/sec/credentials.cpt ~/.aws
ccdecrypt -f ~/.aws/credentials.cpt
chmod 600 ~/.aws/credentials

sudo apt-get install -y graphviz maven make openjdk-8-jdk devscripts debhelper rpm
rm -rf neo4j-community-3.0.6-unix.tar.gz
aws s3 cp s3://dependencies256/neo4j-community-3.0.6-unix.tar.gz neo4j-community-3.0.6-unix.tar.gz
rm -rf neo4j-community-3.0.6
tar xvf neo4j-community-3.0.6-unix.tar.gz
cp ivorytowers/neo4j/neo4j.conf neo4j-community-3.0.6/conf
cd neo4j-community-3.0.6
ifconfig | grep "inet addr" | grep -v 127.0.0.1
bin/neo4j console &

#Setup lamp-server
apt-get install -y lamp-server^
rm /var/www/html/index.html
cp -R ivorytowers/html/* /var/www/html

#create another?
#bash ivorytowers/createIvory.sh
