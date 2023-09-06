source .env

# sdxl
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors -d ${SD_MODELS}/Stable-diffusion -o sd_xl_base_1.0.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors -d ${SD_MODELS}/Stable-diffusion -o sd_xl_refiner_1.0.safetensors
