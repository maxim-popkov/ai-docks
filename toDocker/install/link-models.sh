source .env

ln -s ${SD_MODELS}/Stable-diffusion/sd_xl_base_1.0.safetensors ${COMFY_HOME}/models/checkpoints/sd_xl_base_1.0.safetensors
ln -s ${SD_MODELS}/Stable-diffusion/sd_xl_refiner_1.0.safetensors ${COMFY_HOME}/models/checkpoints/sd_xl_refiner_1.0.safetensors
