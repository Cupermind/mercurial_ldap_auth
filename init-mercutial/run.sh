#!/bin/sh
###
/usr/bin/uwsgi --plugin=python /opt/mercurial/etc/hgweb.ini &
/opt/nginx/sbin/nginx -g "daemon off;"
###
