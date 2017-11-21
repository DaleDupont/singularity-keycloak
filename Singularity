# Deploys the keycloak server
BootStrap: docker
From: ubuntu:latest

%environment

    DEBIAN_FRONTEND=noninteractive

%setup

    cp keycloak/keycloakStart.sh ${SINGULARITY_ROOTFS}
    cp keycloak/keycloakConfig.json ${SINGULARITY_ROOTFS}
    cp keycloak/keycloakPassword.sh ${SINGULARITY_ROOTFS}
    cp -r standalone ${SINGULARITY_ROOTFS}

%post

    # Download and install wget, unzip, and java
    apt-get update -y
    apt-get install -y --no-install-recommends apt-utils
    apt-get install -y wget unzip default-jre default-jdk iproute curl libxml2-utils 

    # Go to the srv directory
    cd /srv

    # Download and unzip Keycloak
    wget https://downloads.jboss.org/keycloak/3.4.0.Final/keycloak-3.4.0.Final.zip
    unzip keycloak-3.4.0.Final.zip
    rm keycloak-3.4.0.Final.zip

    mv /keycloakStart.sh /srv/keycloakStart.sh
    mv /keycloakConfig.json /srv/keycloakConfig.json
    mv /keycloakPassword.sh /srv/keycloakPassword.sh

    rm -r /srv/keycloak-3.4.0.Final/standalone/tmp
    rm -r /srv/keycloak-3.4.0.Final/standalone/configuration

    mv /standalone/log /srv/keycloak-3.4.0.Final/standalone/log
    mv /standalone/tmp /srv/keycloak-3.4.0.Final/standalone/tmp
    mv /standalone/data /srv/keycloak-3.4.0.Final/standalone/data
    mv /standalone/configuration /srv/keycloak-3.4.0.Final/standalone/configuration

    rmdir /standalone

    chmod a+rwx -R /srv

%runscript

    # Start keycloak when the container is run
    # the keycloakStart.sh script determines the local IP on which
    # the keycloak server should listen
    #exec /srv/keycloakStart.sh False CanDIG admin admin user user
    exec /srv/keycloak-3.4.0.Final/bin/standalone.sh -Dkeycloak.migration.action=import -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.file=/srv/keycloakConfig.json -Dkeycloak.migration.strategy=OVERWRITE_EXISTING
