FROM ubuntu:16.04
MAINTAINER Linktu Meboxen
RUN apt-get update
ARG NEW_PASS

RUN apt-get update
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
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
 nano \
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
 #LEMP stack
 nginx \
 php7.0-fpm \
 php7.0-mbstring \
 php7.0-xml \
 php7.0-mysql \
 php7.0-common \
 php7.0-gd \
 php7.0-json \
 php7.0-cli \
 php7.0-curl \
 && rm -rf /var/lib/apt/lists/*

#AWS Cli
#RUN easy_install pip
#RUN pip install awscli --ignore-installed six

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

#https://www.linuxbabe.com/linux-server/install-nginx-mariadb-php7-lemp-stack-ubuntu-16-04-lts
#https://www.linuxbabe.com/linux-server/drupal-8-ubuntu-16-04-nginx-mariadb-php7

RUN echo '#!/usr/bin/env bash\n\
echo hi\n\
sudo systemctl enable nginx\n\
sudo systemctl start nginx\n\
systemctl status nginx\n\
\n'\
>> /home/cjm/run.sh


RUN echo '#!/usr/bin/env bash\n\
wget https://ftp.drupal.org/files/projects/drupal-8.2.2.tar.gz\n\
#check the checksum here
tar zxvf drupal*.tar.gz\n\
#cp -rf drupal*/* /var/www/html/
#chown www-data:www-data -R /var/www/html/
#chmod -R 755 /var/www/html
\n'\
>> /home/cjm/install_drupal8.sh

RUN sudo chown cjm:cjm /home/cjm/install_drupal8.sh /home/cjm/run.sh
RUN sudo chmod 755 /home/cjm/install_drupal8.sh /home/cjm/run.sh

#https://www.digitalocean.com/community/tutorials/docker-explained-how-to-containerize-and-use-nginx-as-a-proxy
#https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-in-ubuntu-16-04
#https://by-example.org/ubuntu-16-04-xenial-with-multiple-sites-running-http2-and-php7-using-lets-encrypt-for-free-ssl-certificate/