#!/bin/bash
source .env

#apt-get -y install build-essential cmake
conda activate art-env
git clone https://github.com/comfyanonymous/ComfyUI.git ${COMFY_HOME}
git clone https://github.com/ltdrdata/ComfyUI-Manager.git ${COMFY_HOME}/custom_nodes/ComfyUI-Manager
git clone https://github.com/Fannovel16/comfyui_controlnet_aux/ ${COMFY_HOME}/custom_nodes/comfyui_controlnet_aux
git clone https://github.com/RockOfFire/ComfyUI_Comfyroll_CustomNodes.git ${COMFY_HOME}/custom_nodes/ComfyUI_Comfyroll_CustomNodes
git clone https://github.com/WASasquatch/was-node-suite-comfyui/ ${COMFY_HOME}/custom_nodes/was-node-suite-comfyui


# SeargeSDXL WorkFlow
git clone https://github.com/SeargeDP/SeargeSDXL.git ${COMFY_HOME}/custom_nodes/SeargeSDXL


pip install -q -r ${COMFY_HOME}/requirements.txt
pip install -r ${COMFY_HOME}/custom_nodes/comfyui_controlnet_aux/requirements.txt
pip install -r ${COMFY_HOME}/custom_nodes/was-node-suite-comfyui/requirements.txt
pip install -q timm==0.6.7

# deliberate
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/XpucT/Deliberate/resolve/main/Deliberate_v2.safetensors -d ${COMFY_HOME}/models/checkpoints -o Deliberate_v2.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_offset_example-lora_1.0.safetensors -d ${COMFY_HOME}/models/loras -o sd_xl_offset_example-lora_1.0.safetensors



# sdxl
# aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors -d ${COMFY_HOME}/models/checkpoints -o sd_xl_base_1.0.safetensors
# aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors -d ${COMFY_HOME}/models/checkpoints -o sd_xl_refiner_1.0.safetensors

# sdxl cnet
# aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/diffusers/controlnet-canny-sdxl-1.0/resolve/main/diffusion_pytorch_model.fp16.safetensors -d ${COMFY_HOME}/models/controlnet -o sdxl_canny.safetensors
# aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/diffusers/controlnet-depth-sdxl-1.0/resolve/main/diffusion_pytorch_model.fp16.safetensors -d ${COMFY_HOME}/models/controlnet -o sdxl_depth.safetensors

#nmkd upscaler
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M  "https://nmkd.de/shared/ESRGAN/Models/Realistic%2C%20Multipurpose/4x_NMKD-Superscale-SP_178000_G.pth"  -d ${COMFY_HOME}/models/upscale_models/ -o 4x_NMKD-Superscale-SP_178000_G.pth

# python main.py --listen --port 1991
# python ${COMFY_HOME}/main.py --listen --port 1991
#python ${COMFY_HOME}/main.py --dont-print-server