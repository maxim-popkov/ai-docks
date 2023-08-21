#!/bin/bash

# Paths
# ROOT_CACHE_DIR="/root/.cache"
USER_CACHE_DIR="/home/popkov-mi/.cache"
MINICONDA_DIR="/home/popkov-mi/miniconda3/envs/art-env"
SD_APP_DIR="/home/popkov-mi/sd-app/v1/auto" # здесь изменён путь
CONFIG_DIR="/home/popkov-mi/.config"
INSIGHTFACE_DIR="/home/popkov-mi/.insightface"
KERAS_DIR="/home/popkov-mi/.keras"
NV_DIR="/home/popkov-mi/.nv"
CACHE_DIR="/home/popkov-mi/.cache"
IFNUDE_DIR="/home/popkov-mi/.ifnude"
IPYTHON_DIR="/home/popkov-mi/.ipython"
LOCAL_DIR="/home/popkov-mi/.local"
CN_ANNOTATOR_DIR="/home/popkov-mi/sd-app/cn-annotator"
CN15_MODELS_DIR="/home/popkov-mi/sd-app/cn15-models"
CN21_MODELS_DIR="/home/popkov-mi/sd-app/cn21-models"
SD15_MODELS_DIR="/home/popkov-mi/sd-app/sd15-models"
SD21_MODELS_DIR="/home/popkov-mi/sd-app/sd21-models"
VAE_DIR="/home/popkov-mi/sd-app/vae"

# Destination directory
DESTINATION_DIR="/home/popkov-mi/archives/" # здесь изменён путь
mkdir -p ${DESTINATION_DIR}

# Create tar archives and split them if size is more than 2GB
# tar -cvpf - ${ROOT_CACHE_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}root_cache_dir.tar.gz.
tar -cvpf - ${USER_CACHE_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}user_cache_dir.tar.gz.
tar -cvpf - ${MINICONDA_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}miniconda_dir.tar.gz.
tar -cvpf - ${SD_APP_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}sd_app_dir.tar.gz.
tar -cvpf - ${CONFIG_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}config_dir.tar.gz.
tar -cvpf - ${INSIGHTFACE_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}insightface_dir.tar.gz.
tar -cvpf - ${KERAS_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}keras_dir.tar.gz.
tar -cvpf - ${NV_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}nv_dir.tar.gz.
tar -cvpf - ${CACHE_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}cache_dir.tar.gz.
tar -cvpf - ${IFNUDE_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}ifnude_dir.tar.gz.
tar -cvpf - ${IPYTHON_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}ipython_dir.tar.gz.
tar -cvpf - ${LOCAL_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}local_dir.tar.gz.
tar -cvpf - ${CN_ANNOTATOR_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}cn_annotator_dir.tar.gz.
tar -cvpf - ${CN15_MODELS_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}cn15_models_dir.tar.gz.
tar -cvpf - ${CN21_MODELS_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}cn21_models_dir.tar.gz.
tar -cvpf - ${SD15_MODELS_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}sd15_models_dir.tar.gz.
tar -cvpf - ${SD21_MODELS_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}sd21_models_dir.tar.gz.
tar -cvpf - ${VAE_DIR} | gzip | split -b 2G - ${DESTINATION_DIR}vae_dir.tar.gz.
