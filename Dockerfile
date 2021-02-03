ARG	IMAGE=ubuntu
ARG	TAG=20.04
FROM $IMAGE:$TAG
MAINTAINER Felix Kazuya <me@felixkazuya.de>
MAINTAINER Christian Walonka <cwalonka@it-economics.de>
ENV REFRESHED_AT 2019-09-03
#Setting up required Environment
ENV TERM xterm
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /
COPY files/ /
RUN chmod a+x /install.sh && \
    /install.sh && \
    rm -f /install.sh

#Startconfig
ENTRYPOINT ["/entrypoint"]
CMD ["sleep", "infinity"]

