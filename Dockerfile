# Instal additional packages for zabbix checks
# Based on zabbix-server-mysql:alpine-4.0.0

FROM zabbix/zabbix-server-mysql:alpine-4.0.0
MAINTAINER Stanislav Osipov <stanislav.osipov@jetbrains.com>
ADD zabbix-entrypoint.sh /
ENTRYPOINT /zabbix-entrypoint.sh

RUN apk update && \
    apk -U add openssl bc jq curl git perl perl-json py-pip && \
    rm -rf /var/cache/apk/*

RUN pip install -q python-dateutil xmltodict
RUN rm /usr/bin/docker-entrypoint.sh
