# Instal additional packages for zabbix checks
# Based on zabbix-server-mysql:alpine-4.2.5

FROM zabbix/zabbix-server-mysql:alpine-4.2.5
MAINTAINER Stanislav Osipov <stanislav.osipov@jetbrains.com>
ADD zabbix-entrypoint.sh /
ENTRYPOINT /zabbix-entrypoint.sh

RUN apk update && \
    apk -U add openssl openssh bc jq curl git perl perl-json py-pip grep && \
    rm -rf /var/cache/apk/*

RUN pip install -q python-dateutil xmltodict
RUN rm /usr/bin/docker-entrypoint.sh
