#!/bin/bash

# Paths
PARENT_DIR="/home/popkov-mi/sd-app/v1"
DIR_NAME="auto"

# Destination directory
DESTINATION_DIR="/home/popkov-mi/archives/"
mkdir -p ${DESTINATION_DIR}

# Create tar archives and split them if size is more than 2GB
cd ${PARENT_DIR} && tar -cvpf - ${DIR_NAME} | gzip | split -b 2G - ${DESTINATION_DIR}sd_app_dir.tar.gz.


#cat /home/popkov-mi/archives/comfy_app_dir.tar.gz.* | gzip -d | tar -xvf - -C /home/popkov-mi/archives/comfy_app