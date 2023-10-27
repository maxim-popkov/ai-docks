source .env

# SDXL
ln -sf ${SD_MODELS}/Stable-diffusion/sd_xl_base_1.0.safetensors ${COMFY_HOME}/models/checkpoints/sd_xl_base_1.0.safetensors
ln -sf ${SD_MODELS}/Stable-diffusion/sd_xl_refiner_1.0.safetensors ${COMFY_HOME}/models/checkpoints/sd_xl_refiner_1.0.safetensors

# SDXL CNET
ln -sf ${CNXL_MODELS}/Stable-diffusion/sd_xl_base_1.0.safetensors ${COMFY_HOME}/models/controlnet/sdxl_canny.safetensors
ln -sf ${CNXL_MODELS}/Stable-diffusion/sd_xl_refiner_1.0.safetensors ${COMFY_HOME}/models/controlnet/sdxl_depth.safetensors
