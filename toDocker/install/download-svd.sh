#!/bin/bash
source .env

SVD_MODELS="/home/popkov-mi/sd-app/svd-models"

mkdir -p ${SVD_MODELS}
mkdir -p ${COMFY_HOME}/models/svd/

# svd models
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/stabilityai/stable-video-diffusion-img2vid/resolve/main/svd.safetensors -d ${SVD_MODELS} -o svd.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/stabilityai/stable-video-diffusion-img2vid/resolve/main/svd_image_decoder.safetensors -d ${SVD_MODELS} -o svd_image_decoder.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/stabilityai/stable-video-diffusion-img2vid-xt/resolve/main/svd_xt.safetensors -d ${SVD_MODELS} -o svd_xt.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/stabilityai/stable-video-diffusion-img2vid-xt/resolve/main/svd_xt_image_decoder.safetensors -d ${SVD_MODELS} -o svd_xt_image_decoder.safetensors

ln -sf ${SVD_MODELS}/svd.safetensors ${COMFY_HOME}/models/svd/svd.safetensors
ln -sf ${SVD_MODELS}/svd_image_decoder.safetensors ${COMFY_HOME}/models/svd/svd_image_decoder.safetensors
ln -sf ${SVD_MODELS}/svd_xt.safetensors ${COMFY_HOME}/models/svd/svd_xt.safetensors
ln -sf ${SVD_MODELS}/svd_xt_image_decoder.safetensors ${COMFY_HOME}/models/svd/svd_xt_image_decoder.safetensors

ln -sf ${SVD_MODELS}/svd.safetensors ${COMFY_HOME}/models/checkpoints/svd.safetensors

# SVD_MODELS="/home/popkov-mi/sd-app/sdv-models"
# ln -sf ${SVD_MODELS}/svd.safetensors ${COMFY_HOME}/models/checkpoints/svd.safetensors