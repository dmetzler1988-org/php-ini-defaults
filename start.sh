#!/bin/sh

if ! docker info > /dev/null 2>&1; then
    echo "This script uses docker, and it isn't running - please start docker and try again!"
    exit 1
fi

#################
# PHP 5.6
#################
# Check if folder exist, if yes, remove it
[ -d 5.6 ] && rm -rf ./5.6
# Create a new clean folder to save files in it from docker container.
mkdir ./5.6
# Create a new docker container from PHP image.
docker create -it --name php56 php:5.6-alpine bash
# Copy PHP files from docker container to local folder.
docker cp php56:/usr/local/etc/php ./5.6
# Remove docker container.
docker rm -f php56

#################
# PHP 7.0
#################
# Check if folder exist, if yes, remove it
[ -d 7.0 ] && rm -rf ./7.0
# Create a new clean folder to save files in it from docker container.
mkdir ./7.0
# Create a new docker container from PHP image.
docker create -it --name php70 php:7.0-alpine bash
# Copy PHP files from docker container to local folder.
docker cp php70:/usr/local/etc/php ./7.0
# Remove docker container.
docker rm -f php70

#################
# PHP 7.1
#################
# Check if folder exist, if yes, remove it
[ -d 7.1 ] && rm -rf ./7.1
# Create a new clean folder to save files in it from docker container.
mkdir ./7.1
# Create a new docker container from PHP image.
docker create -it --name php71 php:7.1-alpine bash
# Copy PHP files from docker container to local folder.
docker cp php71:/usr/local/etc/php ./7.1
# Remove docker container.
docker rm -f php71

#################
# PHP 7.2
#################
# Check if folder exist, if yes, remove it
[ -d 7.2 ] && rm -rf ./7.2
# Create a new clean folder to save files in it from docker container.
mkdir ./7.2
# Create a new docker container from PHP image.
docker create -it --name php72 php:7.2-alpine bash
# Copy PHP files from docker container to local folder.
docker cp php72:/usr/local/etc/php ./7.2
# Remove docker container.
docker rm -f php72

#################
# PHP 7.3
#################
# Check if folder exist, if yes, remove it
[ -d 7.3 ] && rm -rf ./7.3
# Create a new clean folder to save files in it from docker container.
mkdir ./7.3
# Create a new docker container from PHP image.
docker create -it --name php73 php:7.3-alpine bash
# Copy PHP files from docker container to local folder.
docker cp php73:/usr/local/etc/php ./7.3
# Remove docker container.
docker rm -f php73

#################
# PHP 7.4
#################
# Check if folder exist, if yes, remove it
[ -d 7.4 ] && rm -rf ./7.4
# Create a new clean folder to save files in it from docker container.
mkdir ./7.4
# Create a new docker container from PHP image.
docker create -it --name php74 php:7.4-alpine bash
# Copy PHP files from docker container to local folder.
docker cp php74:/usr/local/etc/php ./7.4
# Remove docker container.
docker rm -f php74

#################
# PHP 8.0
#################
# Check if folder exist, if yes, remove it
[ -d 8.0 ] && rm -rf ./8.0
# Create a new clean folder to save files in it from docker container.
mkdir ./8.0
# Create a new docker container from PHP image.
docker create -it --name php80 php:8.0-alpine bash
# Copy PHP files from docker container to local folder.
docker cp php80:/usr/local/etc/php ./8.0
# Remove docker container.
docker rm -f php80

#################
# PHP 8.1
#################
# Check if folder exist, if yes, remove it
[ -d 8.1 ] && rm -rf ./8.1
# Create a new clean folder to save files in it from docker container.
mkdir ./8.1
# Create a new docker container from PHP image.
docker create -it --name php81 php:8.1-alpine bash
# Copy PHP files from docker container to local folder.
docker cp php81:/usr/local/etc/php ./8.1
# Remove docker container.
docker rm -f php81

#################
# PHP 8.2
#################
# Check if folder exist, if yes, remove it
[ -d 8.2 ] && rm -rf ./8.2
# Create a new clean folder to save files in it from docker container.
mkdir ./8.2
# Create a new docker container from PHP image.
docker create -it --name php82 php:8.2-alpine bash
# Copy PHP files from docker container to local folder.
docker cp php82:/usr/local/etc/php ./8.2
# Remove docker container.
docker rm -f php82

#################
# PHP 8.3
#################
# Check if folder exist, if yes, remove it
[ -d 8.3 ] && rm -rf ./8.3
# Create a new clean folder to save files in it from docker container.
mkdir ./8.3
# Create a new docker container from PHP image.
docker create -it --name php83 php:8.3-alpine bash
# Copy PHP files from docker container to local folder.
docker cp php83:/usr/local/etc/php ./8.3
# Remove docker container.
docker rm -f php83
