# Deploys the keycloak server
BootStrap: docker
From: ubuntu:latest

%environment

    DEBIAN_FRONTEND=noninteractive

%setup

    cp keycloak/keycloakStart.sh ${SINGULARITY_ROOTFS}
    cp keycloak/keycloakConfig.json ${SINGULARITY_ROOTFS}
    cp keycloak/keycloakPassword.sh ${SINGULARITY_ROOTFS}

%post

    # Download and install wget, unzip, and java
    apt-get update -y
    apt-get install -y --no-install-recommends apt-utils
    apt-get install -y wget unzip default-jre default-jdk iproute curl libxml2-utils 

    # Go to the srv directory
    cd /srv

    # Download and unzip Keycloak
    wget https://downloads.jboss.org/keycloak/3.3.0.CR2/keycloak-3.3.0.CR2.zip
    unzip keycloak-3.3.0.CR2.zip

    mv /keycloakStart.sh /srv/keycloakStart.sh
    mv /keycloakConfig.json /srv/keycloakConfig.json
    mv /keycloakPassword.sh /srv/keycloakPassword.sh

    chmod +x /srv/keycloakStart.sh
    chmod +x /srv/keycloakPassword.sh

    chmod o+rw -R /srv/keycloak-3.3.0.CR2/standalone
    chmod o+rw -R /srv/keycloak-3.3.0.CR2/bin
    chmod o+rw -R /srv/keycloak-3.3.0.CR2/modules
    chmod o+rw -R /srv/keycloak-3.3.0.CR2/welcome-content
    chmod o+rw -R /srv/keycloak-3.3.0.CR2/themes
    chmod o+rwx /srv/keycloak-3.3.0.CR2/jboss-modules.jar

%runscript

    # Start keycloak when the container is run
    # the keycloakStart.sh script determines the local IP on which
    # the keycloak server should listen
    #exec /srv/keycloakStart.sh False CanDIG admin admin user user
    exec /srv/keycloak-3.3.0.CR2/bin/standalone.sh -Dkeycloak.migration.action=import -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.file=/srv/keycloakConfig.json -Dkeycloak.migration.strategy=OVERWRITE_EXISTING
