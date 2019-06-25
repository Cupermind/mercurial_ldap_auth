
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

j2 -f json /opt/INIT.j2 /opt/Vars.json > /opt/ldap/etc/openldap/INIT.ldif
j2 -f json /opt/ldap.j2 /opt/Vars.json > /opt/ldap/etc/openldap/ldap.conf
j2 -f json /opt/slapd.j2 /opt/Vars.json > /opt/ldap/etc/openldap/slapd.conf

/opt/ldap/sbin/slapadd -v -d2 -f /opt/ldap/etc/openldap/slapd.conf -l /opt/ldap/etc/openldap/INIT.ldif

chown -R root:root /opt/ldap/etc/openldap/* && chown -R root:root /opt/ldap/var/*
chown root:root /opt/ldap/etc/openldap/ssl/* && chmod 440 /opt/ldap/etc/openldap/ssl/*

rm -f /opt/*.j2 /opt/*.json /opt/*.sh /opt/ldap/etc/openldap/INIT.ldif
