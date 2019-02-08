#!/bin/sh
###
LDAPHOME="/opt/ldap"
NGINXHOME="/opt/nginx"
LOG="/opt/ldap/var/logs/slapd.log"
###
service php7.0-fpm start
cd ${NGINXHOME}
sbin/nginx
###
cd ${LDAPHOME}
libexec/slapd -4 -d 512 > ${LOG}
###
