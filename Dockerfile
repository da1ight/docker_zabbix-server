# Instal additional packages for zabbix checks
# Based on zabbix-server-mysql:latest

FROM zabbix/zabbix-server-mysql:latest
MAINTAINER Stanislav Osipov <stanislav.osipov@jetbrains.com>
RUN apk update && \
    apk -U add openssl bc jq curl perl perl-json && \
    rm -rf /var/cache/apk/*
