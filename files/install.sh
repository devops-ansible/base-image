#!/usr/bin/env bash


apt-get -y update
apt-get install -y --no-install-recommends apt-utils

apt-get -y upgrade 

apt-get install -y locales xmlstarlet python3 python3-yaml python3-jinja2 \
    python3-httplib2 python3-paramiko python3-setuptools python3-pkg-resources \
    python3-pip htop tree nano vim wget curl software-properties-common libcurl4-gnutls-dev \
    libexpat1-dev gettext libz-dev libssl-dev build-essential autoconf git awscli zip unzip && \

apt-get autoremove 
apt-get autoclean 
apt-get clean 


pip3 install --upgrade pip 
pip install python3-keyczar ln -s /usr/bin/python3 /usr/bin/python
mkdir /etc/ansible/ 
echo '[local]\nlocalhost\n' > /etc/ansible/hosts


locale-gen de_DE 
locale-gen de_DE.UTF-8
update-locale

echo "Built at" $(date) > /etc/built_at
