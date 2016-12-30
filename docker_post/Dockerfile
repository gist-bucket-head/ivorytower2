#Make sure this Dockerfile is in ~/neobox
#cd ~/neobox; docker build -t 'name:Neo1' . && docker run -it -p 7474:7474 name:Neo1

#This is a comment.
#Dockerfile for neo4j box. Repeatable man.
#To build: docker build -t 'name:Neo1' .
#To run: docker run -it name:Neo1
#To build and run: docker build -t 'name:Neo1' . && docker run -it -p 7474:7474 name:Neo1
#but first, install Docker of course, and also, do this: docker pull ubuntu:16.04
#comment, docker 
FROM ubuntu:16.04
MAINTAINER Linktu Meboxen
RUN apt-get update
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
#RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y sudo
RUN echo 'Acquire::ForceIPv4 "true";' | sudo tee /etc/apt/apt.conf.d/99force-ipv4;
RUN apt-get -y update && apt-get -y upgrade && apt-get install -y \
 #basic stuff
 lsb-release \
 curl \
 wget \
 git \
 zip \
 ccrypt \
 nano \
 vim \
 perl \
 #required for neo4j
 graphviz \
 maven \
 make \
 openjdk-8-jdk \
 devscripts \
 debhelper \
 rpm \
 #required for aws interface
 python-setuptools \
 python-dev \
 build-essential \
 npm \
 #node \
 nodejs \
 nodejs-legacy \
 && rm -rf /var/lib/apt/lists/*

#AWS Cli
RUN easy_install pip
RUN pip install awscli --ignore-installed six

# Linode Cli 
RUN echo "deb http://apt.linode.com/ stable main" > /etc/apt/sources.list.d/linode.list
RUN wget -O- https://apt.linode.com/linode.gpg | sudo apt-key add -
RUN apt-get update
RUN apt-get install -y linode-cli && rm -rf /var/lib/apt/lists/*

# see ivorytowers s1 and createIvory and initialSetup 
ENV NEW_USER=cjm
#RUN echo $NEW_USER
ARG NEW_PASS
#ARG MY_IP
#ENV MY_IP=$MY_IP
ENV NEW_PASS=$NEW_PASS
ENV TEMP_PASSWORD=$NEW_PASS
#RUN echo $TEMP_PASSWORD
RUN TEMP_ENCRYPTED_PASSWORD=`perl -e 'printf("%s\n", crypt($ARGV[0], "password"))' "$TEMP_PASSWORD"` && useradd -m -p $TEMP_ENCRYPTED_PASSWORD -s /bin/bash $NEW_USER -G sudo
RUN sudo bash -c 'echo "'$NEW_USER' ALL=(ALL:ALL) ALL" | (EDITOR="tee -a" visudo)'

RUN mkdir /home/cjm/.ssh
RUN sudo echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> /home/cjm/.ssh/config

RUN echo '#!/usr/bin/env bash\n\
rm -rf master.zip\n\
rm -rf ivorytower-master\n\
wget https://github.com/gist-bucket-head/ivorytower/archive/master.zip\n\
unzip master.zip\n\
rm -rf ~/.linodecli\n\
mkdir -p ~/.linodecli\n\
cp ivorytower-master/sec/config.cpt ~/.linodecli\n\
ccdecrypt -f ~/.linodecli/config.cpt\n\
chmod 600 ~/.linodecli/config\n\
rm -rf ~/.sec\n\
mkdir -p ~/.sec\n\
cp ivorytower-master/sec/gitconfig.sh.cpt ~/.sec\n\
ccdecrypt -f ~/.sec/gitconfig.sh.cpt\n\
bash ~/.sec/gitconfig.sh\n\
rm -rf ivorytower\n\
git config user.name "gist-bucket-head"\n\
git clone https://github.com/gist-bucket-head/ivorytower.git\n\
rm -rf ~/.aws\n\
mkdir -p ~/.aws\n\
chmod 755 ~/.aws\n\
cp ivorytower-master/sec/awsconfig.cpt ~/.aws\n\
ccdecrypt -f ~/.aws/awsconfig.cpt\n\
mv ~/.aws/awsconfig ~/.aws/config\n\
chmod 600 ~/.aws/config\n\
cp ivorytower-master/sec/credentials.cpt ~/.aws\n\
ccdecrypt -f ~/.aws/credentials.cpt\n\
chmod 600 ~/.aws/credentials\n\
rm -rf neo4j-community-3.0.6-unix.tar.gz\n\
aws s3 cp s3://dependencies256/neo4j-community-3.0.6-unix.tar.gz neo4j-community-3.0.6-unix.tar.gz\n\
rm -rf neo4j-community-3.0.6\n\
tar xvf neo4j-community-3.0.6-unix.tar.gz\n\
cp ivorytower/neo4j/neo4j.conf neo4j-community-3.0.6/conf\n\
\n'\
>> /home/cjm/setup_as_user.sh

RUN echo '#!/usr/bin/env bash\n\
echo "nn as in Neo4J with Node"\n\
echo "run with sudo"\n\
rm -rf neotest\n\
mkdir neotest\n\
cd neotest\n\
npm init -f\n\
npm install neo4j-driver@1.0.3\n\
npm install http-server -g\n\
#echo "Hi" >> index.html\n\
cp node_modules/neo4j-driver/examples/* .\n\
sudo sed -i "s/\\.\\.\\/lib/node_modules\\/neo4j-driver\\/lib/g" neo4j.html\n\
sudo sed -i "s/\\"neo4j\\", \\"neo4j\\"/\\"neo4j\\", \\"Chris\\"/g" neo4j.html\n\
sudo sed -i "s/localhost/69.164.218.97/g" neo4j.html\n\
\n'\
>> /home/cjm/setup_with_sudo.sh

RUN echo '#!/usr/bin/env bash\n\
cd neo4j-community-3.0.6 && ./bin/neo4j console &\n\
cd neotest\n\
http-server &\n\
\n'\
>> /home/cjm/run.sh

RUN chown cjm:cjm /home/cjm/setup_as_user.sh /home/cjm/run.sh /home/cjm/setup_with_sudo.sh
RUN chmod 755 /home/cjm/setup_as_user.sh /home/cjm/run.sh /home/cjm/setup_with_sudo.sh
