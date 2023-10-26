#!/bin/bash

# Paths
PARENT_DIR="/home/popkov-mi"
DIR_NAME="comfy-app"

# Destination directory
DESTINATION_DIR="/home/popkov-mi/archives/"
mkdir -p ${DESTINATION_DIR}

# Create tar archives and split them if size is more than 2GB
cd ${PARENT_DIR} && tar -cvpf - ${DIR_NAME} | gzip | split -b 2G - ${DESTINATION_DIR}comfy_app_dir.tar.gz.
