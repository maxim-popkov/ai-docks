#!/bin/bash

# Paths
HOME_DIR="/home/popkov-mi"

# Destination directory
DESTINATION_DIR="/root/archives/"

# Create and compress tar archives in one step
tar -cvpzf ${DESTINATION_DIR}home_dir.tar.gz ${HOME_DIR}
