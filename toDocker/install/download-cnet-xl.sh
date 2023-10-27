source .env

# sdxl cnet
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/diffusers_xl_canny_full.safetensors -d ${CNXL_MODELS} -o sdxl_canny.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/diffusers_xl_depth_full.safetensors -d ${CNXL_MODELS} -o sdxl_depth.safetensors
