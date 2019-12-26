# Instal additional packages for zabbix checks
# Based on zabbix-server-mysql:alpine-4.2.5

FROM zabbix/zabbix-server-mysql:alpine-4.2.5
MAINTAINER Stanislav Osipov <stanislav.osipov@jetbrains.com>
ADD zabbix-entrypoint.sh /
ENTRYPOINT /zabbix-entrypoint.sh

RUN apk update && apk upgrade && \
    apk -U add openssl openssh bc jq curl git perl perl-json py-pip grep docker && \
    rm -rf /var/cache/apk/*

RUN export DOCKER_API_VERSION=1.19
RUN pip install -q python-dateutil xmltodict
RUN rm /usr/bin/docker-entrypoint.sh
