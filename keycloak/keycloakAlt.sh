#!/bin/bash
umask 0
ANCHOR="/srv/out.dat"
if [ -e "${ANCHOR}" ]
then
    rm "${ANCHOR}"
fi

/srv/keyPwdSing.sh &

/srv/keycloak-3.4.0.Final/bin/standalone.sh -b "${IPADDR}" -Djboss.http.port="${PORT}" -Dkeycloak.migration.action=import -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.file="${CONFIGFILE}" -Dkeycloak.migration.strategy=OVERWRITE_EXISTING 

exit 0






