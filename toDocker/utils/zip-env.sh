#!/bin/bash

# Paths
PARENT_DIR="/home/popkov-mi/miniconda3/envs"
DIR_NAME="art-env"

# Destination directory
DESTINATION_DIR="/home/popkov-mi/archives/"
mkdir -p ${DESTINATION_DIR}

# Create tar archives and split them if size is more than 2GB
cd ${PARENT_DIR} && tar -cvpf - ${DIR_NAME} | gzip | split -b 2G - ${DESTINATION_DIR}miniconda_dir.tar.gz.


#cat /home/popkov-mi/archives/comfy_app_dir.tar.gz.* | gzip -d | tar -xvf - -C /home/popkov-mi/archives/comfy_app