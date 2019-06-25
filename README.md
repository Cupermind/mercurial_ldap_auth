
The highest verstion of PHP that works with phpLDAPadmin is 7.0.
Even this version has to be patched a little, the patch is provided.
The latest PHP version 7.2 that is installed by default on ubuntu 18.04
does not work with phpLDAPadmin, since some functions are deprecated from PHP7.2

The resulting image "ua2web/ldap:2.4.47" is two in one. It includes a ready LDAP
server with a DB skel to add more users for HTTP Auth plus an nginx based WEB interface
to manage this DB easily. It's just ready out of the box.
Default root credentials: cn=root,SUFFIX_BASE / ROOTDN - set these VARs in "Dockerfile.ldap_phpldapadmin" and "Dockerfile.mercurial"
You can see all the DB from the CLI in the following way.

/opt/ldap/bin/ldapsearch -H ldap://localhost -c -x -D "cn=root,SUFFIX_BASE" -w ROOTDN '(objectclass=*)'


The HTTP Auth users are in the branch "o=htaccess,SUFFIX_BASE"
nginx on Mercurial searches for "uid" and "userPassword" attributes in the DB ubject,
so if you are creating a new user in the WEB interface choose
either "Generic: Simple Security Object" (preferable) or "Samba: Account".
These two templates have the "uid" attribute and a Mercurial user will be authenticated.


The other image "ua2web/mercurial:1.12.2" is also an nginx based WEB viewer of the Mercurial repositories.
Users of the Mercurial are HTTP authenticated against LDAP DB.
