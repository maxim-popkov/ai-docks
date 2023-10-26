#!/bin/bash

# Paths
# ROOT_CACHE_DIR="/root/.cache"
MINICONDA_DIR="/home/popkov-mi/miniconda3/envs/art-env"

# Destination directory
DESTINATION_DIR="/home/popkov-mi/archives/" # здесь изменён путь
mkdir -p ${DESTINATION_DIR}

# Create tar archives and split them if size is more than 2GB
tar -cvpf - ${MINICONDA_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}miniconda_dir.tar.gz.
