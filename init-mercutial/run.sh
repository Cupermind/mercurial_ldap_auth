#!/bin/sh
###
if [ -f /opt/MercVars.sh ]; then
    /opt/MercVars.sh
fi
###
/usr/bin/uwsgi --plugin=python /opt/mercurial/etc/hgweb.ini &
/opt/nginx/sbin/nginx -g "daemon off;"
###
