ARG	IMAGE=ubuntu
ARG	TAG=18.04
FROM $IMAGE:$TAG
MAINTAINER Felix Kazuya <me@felixkazuya.de>
MAINTAINER Christian Walonka <cwalonka@it-economics.de>
ENV REFRESHED_AT 2019-09-03
#Setting up required Environment
ENV TERM xterm
ENV DEBIAN_FRONTEND=noninteractive

#Installing Required Stuff
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends apt-utils &&\
    apt-get -y upgrade && \
    apt-get install -y locales xmlstarlet python3 python3-yaml python3-jinja2 \
    python3-httplib2 python3-paramiko python3-setuptools python3-pkg-resources \
    python3-pip htop tree nano vim wget curl software-properties-common libcurl4-gnutls-dev \
    libexpat1-dev gettext libz-dev libssl-dev build-essential autoconf git awscli zip unzip && \
    apt-get autoremove && \
    apt-get autoclean && \
    apt-get clean 

RUN pip3 install --upgrade pip && pip install python3-keyczar && ln -s /usr/bin/python3 /usr/bin/python && \
    mkdir /etc/ansible/ && \
    echo '[local]\nlocalhost\n' > /etc/ansible/hosts
RUN pip3 install ansible

RUN locale-gen de_DE && \
    locale-gen de_DE.UTF-8 && \
    update-locale

#ADD IT-ECONOMICS RootCA - this will be removed later
RUN wget http://ca.it-economics.de/it-economics_CA.crt -P /usr/share/ca-certificates && \
chmod 0755 /usr/share/ca-certificates/it-economics_CA.crt && \
echo "it-economics_CA.crt" >> /etc/ca-certificates.conf && update-ca-certificates

#Date of Build
RUN echo "Built at" $(date) > /etc/built_at

#Startconfig
CMD [ "cat", "/etc/built_at" ]
