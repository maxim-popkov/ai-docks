#!/bin/bash

# Destination directory
DESTINATION_DIR="/home/popkov-mi/archives/"

# Directories to extract
DIRECTORIES=(
  root_cache_dir 
  user_cache_dir 
  miniconda_dir 
  sd_app_dir 
  config_dir 
  insightface_dir 
  keras_dir 
  nv_dir 
  cache_dir 
  ifnude_dir 
  ipython_dir 
  local_dir 
  cn_annotator_dir 
  cn15_models_dir 
  cn21_models_dir 
  sd15_models_dir 
  sd21_models_dir 
  vae_dir
)

# Base paths
BASE_PATHS=(
  "/root/.cache" 
  "/home/popkov-mi/.cache" 
  "/home/popkov-mi/miniconda3/envs/art-env" 
  "/home/popkov-mi/sd-app/v1/auto" 
  "/home/popkov-mi/.config" 
  "/home/popkov-mi/.insightface" 
  "/home/popkov-mi/.keras" 
  "/home/popkov-mi/.nv" 
  "/home/popkov-mi/.cache" 
  "/home/popkov-mi/.ifnude" 
  "/home/popkov-mi/.ipython" 
  "/home/popkov-mi/.local" 
  "/home/popkov-mi/sd-app/cn-annotator" 
  "/home/popkov-mi/sd-app/cn15-models" 
  "/home/popkov-mi/sd-app/cn21-models" 
  "/home/popkov-mi/sd-app/sd15-models" 
  "/home/popkov-mi/sd-app/sd21-models" 
  "/home/popkov-mi/sd-app/vae"
)

# Loop over all directories
for (( i=0; i<${#DIRECTORIES[@]}; i++ )); do
  # Concatenate the split tar files
  cat ${DESTINATION_DIR}${DIRECTORIES[$i]}.tar.gz.* > ${DESTINATION_DIR}${DIRECTORIES[$i]}.tar.gz
  
  # Extract the tar files to the appropriate directory
  mkdir -p ${BASE_PATHS[$i]}
  tar -xzvf ${DESTINATION_DIR}${DIRECTORIES[$i]}.tar.gz -C ${BASE_PATHS[$i]}
  
  # Remove the concatenated tar file
  rm ${DESTINATION_DIR}${DIRECTORIES[$i]}.tar.gz
done
