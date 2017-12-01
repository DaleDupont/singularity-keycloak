# singularity-keycloak
Singularity recipe repository for Keycloak authentication server.

Building the container requires ``sudo`` privileges. To make the container executable for non-root users perform the following:

To build, you must make the container ``writable``:

::

    $ singularity build --writable keycloak.img Singularity

You must also assign write permissions to all users:

::

    $ chmod a+rwx keycloak.img


To run the container as a non-root user successfully:

First declare the following environment variables and export them.
Their defaults are given in this listing:

::

    SINGULARITYENV_PORT="8080"
    SINGULARITYENV_IPADDR="127.0.0.1"
    SINGULARITYENV_CONFIGFILE="/home/coop/betus/singHackFull/keycloak/keycloakConfig.json"
    SINGULARITYENV_REALM_NAME="CanDIG"
    SINGULARITYENV_ADMIN_USERNAME="admin"
    SINGULARITYENV_ADMIN_PASSWORD="admin"
    SINGULARITYENV_USER_USERNAME="user"
    SINGULARITYENV_USER_PASSWORD="user"
    export SINGULARITYENV_PORT
    export SINGULARITYENV_IPADDR
    export SINGULARITYENV_CONFIGFILE
    export SINGULARITYENV_REALM_NAME
    export SINGULARITYENV_ADMIN_USERNAME
    export SINGULARITYENV_ADMIN_PASSWORD
    export SINGULARITYENV_USER_USERNAME
    export SINGULARITYENV_USER_PASSWORD

Then run the singularity image as writable:

::

    $ singularity run --writable keycloak.img


When uploading the built image as a release, compress the image using ``gzip`` first:

::

    gzip keycloak.img




