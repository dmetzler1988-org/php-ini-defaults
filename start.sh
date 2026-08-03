#!/bin/bash

if ! docker info > /dev/null 2>&1; then
    echo "This script uses docker, and it isn't running - please start docker and try again!"
    exit 1
fi

# PHP versions providing an alpine image
PHP_VERSIONS=(5.6 7.0 7.1 7.2 7.3 7.4 8.0 8.1 8.2 8.3 8.4 8.5)
# PHP versions without an alpine image, the cli image is used for them instead
PHP_VERSIONS_CLI=(5.4 5.5)

# Copy the PHP config files of one version out of the given docker image
collect_version() {
    VERSION=$1
    IMAGE=$2
    CONTAINER_NAME=php$VERSION
    # Skip the version if the image cannot be downloaded
    if ! docker pull $IMAGE > /dev/null 2>&1; then
        echo "PHP $VERSION: image $IMAGE not found - skipped."
        return
    fi
    # Check if folder exist, if yes, remove it
    [ -d $VERSION ] && rm -rf ./$VERSION
    # Create a new clean folder to save files in it from docker container
    mkdir ./$VERSION
    # Create a new docker container from PHP image
    docker create -it --name $CONTAINER_NAME $IMAGE bash > /dev/null
    # Copy PHP files from docker container to local folder
    docker cp $CONTAINER_NAME:/usr/local/etc/php ./$VERSION
    # Remove docker container
    docker rm -f $CONTAINER_NAME > /dev/null
    echo "PHP $VERSION: done."
}

# Loop through PHP versions with an alpine image
for VERSION in "${PHP_VERSIONS[@]}"
do
    collect_version $VERSION php:$VERSION-alpine
done

# Loop through PHP versions using the cli image
for VERSION in "${PHP_VERSIONS_CLI[@]}"
do
    collect_version $VERSION php:$VERSION-cli
done
