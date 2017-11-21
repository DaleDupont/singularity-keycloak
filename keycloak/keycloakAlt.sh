#!/bin/bash

umask 0
/srv/keycloak-3.4.0.Final/bin/standalone.sh -Dkeycloak.migration.action=import -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.file=/srv/keycloakConfig.json -Dkeycloak.migration.strategy=OVERWRITE_EXISTING
