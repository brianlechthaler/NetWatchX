## Configuration
# Environment Variables
ENV PackagesToInstall "tshark"

## Image Selection
# Start from Alpine Edge
FROM alpine:edge

## Pre-requisites & Preparations
# Make sure this image is up-to-date
RUN apk update
RUN apk upgrade

## Install Dependencies
RUN apk add $PackagesToInstall

## Clean up
# Purge caches
RUN rm -rf /var/cache/*

## Finalization
# Copy Start Script
ADD ./dist/start.sh /opt/start.sh
# Set Entrypoint
ENTRYPOINT ["/bin/sh", "/opt/start.sh"]
