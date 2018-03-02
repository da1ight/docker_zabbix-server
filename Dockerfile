# Instal additional packages for zabbix checks
# Based on zabbix-server-mysql:latest

FROM zabbix/zabbix-server-mysql:alpine-3.4.5
MAINTAINER Stanislav Osipov <stanislav.osipov@jetbrains.com>
RUN apk update && \
    apk -U add openssl bc jq curl perl perl-json py-pip && \
    rm -rf /var/cache/apk/*

RUN pip install -q python-dateutil xmltodict
