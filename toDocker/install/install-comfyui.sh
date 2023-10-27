source .env

#apt-get -y install build-essential cmake
conda activate art-env
git clone https://github.com/comfyanonymous/ComfyUI.git ${COMFY_HOME}
git clone https://github.com/Fannovel16/comfy_controlnet_preprocessors ${COMFY_HOME}/custom_nodes/comfy_controlnet_preprocessors 

pip install -q -r ${COMFY_HOME}/requirements.txt
pip install -q timm==0.6.7
python ${COMFY_HOME}/custom_nodes/comfy_controlnet_preprocessors/install.py --no_download_ckpts

# deliberate
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/XpucT/Deliberate/resolve/main/Deliberate_v2.safetensors -d ${COMFY_HOME}/models/checkpoints -o Deliberate_v2.safetensors

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