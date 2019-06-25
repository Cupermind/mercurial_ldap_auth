
echo "SUFFIX_BASE: $SUFFIX_BASE"
echo "ROOTPW: $ROOTPW"
echo "ROOTDN: $ROOTDN"
echo "HTACCESSDN: $HTACCESSDN"
echo "DC_NAME: $DC_NAME"

sed -i -e s/"SUFFIX_BASE"/"$SUFFIX_BASE"/g /opt/Vars.json
sed -i -e s/"ROOTPW"/"$ROOTPW"/g /opt/Vars.json
sed -i -e s/"ROOTDN"/"$ROOTDN"/g /opt/Vars.json
sed -i -e s/"HTACCESSDN"/"$HTACCESSDN"/g /opt/Vars.json
sed -i -e s/"DC_NAME"/"$DC_NAME"/g /opt/Vars.json

j2 -f json /opt/nginx-mercurial.j2 /opt/Vars.json > /opt/nginx/conf/conf.d/nginx-mercurial.conf
rm -f /opt/*.j2 /opt/*.json /opt/*.sh
