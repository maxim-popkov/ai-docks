source .env

# SDXL
ln -sf ${SD_MODELS}/Stable-diffusion/sd_xl_base_1.0.safetensors ${COMFY_HOME}/models/checkpoints/sd_xl_base_1.0.safetensors
ln -sf ${SD_MODELS}/Stable-diffusion/sd_xl_refiner_1.0.safetensors ${COMFY_HOME}/models/checkpoints/sd_xl_refiner_1.0.safetensors

# SDXL CNET ComfyUI
ln -sf ${CNXL_MODELS}/sdxl_canny.safetensors ${COMFY_HOME}/models/controlnet/sdxl_canny.safetensors
ln -sf ${CNXL_MODELS}/sdxl_depth.safetensors ${COMFY_HOME}/models/controlnet/sdxl_depth.safetensors

# SDXL CNET Auto111
ln -sf ${CNXL_MODELS}/sdxl_canny.safetensors ${SD_HOME}/extensions/sd-webui-controlnet/models/sdxl_canny.safetensors
ln -sf ${CNXL_MODELS}/sdxl_depth.safetensors ${SD_HOME}/extensions/sd-webui-controlnet/models/sdxl_depth.safetensors
