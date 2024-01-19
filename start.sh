#!/bin/sh

if ! docker info > /dev/null 2>&1; then
    echo "This script uses docker, and it isn't running - please start docker and try again!"
    exit 1
fi

PHP_VERSIONS=(5.6 7.0 7.1 7.2 7.3 7.4 8.0 8.1 8.2 8.3)

# Loop through PHP versions
for VERSION in "${PHP_VERSIONS[@]}"
do
    CONTAINER_NAME=php$VERSION
    # Check if folder exist, if yes, remove it
    [ -d $VERSION ] && rm -rf ./$VERSION
    # Create a new clean folder to save files in it from docker container
    mkdir ./$VERSION
    # Create a new docker container from PHP image
    docker create -it --name $CONTAINER_NAME php:$VERSION-alpine bash
    # Copy PHP files from docker container to local folder
    docker cp $CONTAINER_NAME:/usr/local/etc/php ./$VERSION
    # Remove docker container
    docker rm -f $CONTAINER_NAME
done
