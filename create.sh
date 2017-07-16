#!/bin/bash

# https://hub.docker.com/r/linuxserver/unifi/
# https://github.com/linuxserver/docker-unifi


# To pull latest: docker pull linuxserver/unifi
# Better success: 
#   1.  git clone https://github.com/linuxserver/docker-unifi.git
#   2.  Place this file within the cloned directory
#   3.  Run this file.


# Update image data
git pull



# Make the docker image, directing the resulting hash to a file
# for later reference.
docker build -t unifi . 

# > ImageHash.txt

HOST_DIR=/data/unifi-controller


# Create the container
docker create \
  --name=unifi \
  -v $HOST_DIR:/config \
  -e PGID=1001 -e PUID=1001  \
  -p 8080:8080 \
  -p 8081:8081 \
  -p 8443:8443 \
  -p 8843:8843 \
  -p 8880:8880 \
  unifi   #      > ContainerHash.txt



# Start the container.
docker start unifi
#docker run \
#  -p 8080:8080 \
#  -p 8081:8081 \
#  -p 8443:8443 \
#  -p 8843:8843 \
#  -p 8880:8880 \
#  --rm \
#  unifi

