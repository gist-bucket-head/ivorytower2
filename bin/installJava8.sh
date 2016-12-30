#!/bin/bash
/bin/bash jdk_download.sh
sudo mkdir /usr/local/java
cd ~/Downloads
sudo mv jdk-8u60-linux-x64.tar.gz /usr/local/java
cd /usr/local/java
sudo tar xvf jdk-8u60-linux-x64.tar.gz
#sudo ln -s jdk1.8.0_60/ java
echo "export JAVA_HOME=/usr/local/java/jdk1.8.0_60" >> ~/.bashrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
