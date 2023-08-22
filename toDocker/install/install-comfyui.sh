COMFY_HOME="/home/popkov-mi/comfy-app"

#apt-get -y install build-essential cmake
conda activate art-env
git clone https://github.com/comfyanonymous/ComfyUI.git ${COMFY_HOME}
git clone https://github.com/Fannovel16/comfy_controlnet_preprocessors ${COMFY_HOME}/custom_nodes/comfy_controlnet_preprocessors 
# git clone https://github.com/camenduru/comfy_controlnet_preprocessors ${COMFY_HOME}/custom_nodes/comfy_controlnet_preprocessors

pip install -q -r ${COMFY_HOME}/requirements.txt
python ${COMFY_HOME}/custom_nodes/comfy_controlnet_preprocessors/install.py --no_download_ckpts

# deliberate
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/XpucT/Deliberate/resolve/main/Deliberate_v2.safetensors -d ${COMFY_HOME}/models/checkpoints -o Deliberate_v2.safetensors

# sdxl
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors -d ${COMFY_HOME}/models/checkpoints -o sd_xl_base_1.0.safetensors
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors -d ${COMFY_HOME}/models/checkpoints -o sd_xl_refiner_1.0.safetensors

#nmkd upscaler
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M  "https://icecube-eu-286.icedrive.io/download?p=a7xvlAQEnVnCFLfHk.6HhqybDsXMCOW64Pp9C_A5ohAeqb2PS_wo1VHjk72_1AU_6BKJOnmHFddCEQLsNVz3hLWb4_WU4cn20uoIvbV7F3VMTY9Hb9tHPoA1mTDZ6cPA.NA4pedor7WeN.cJujh2yGArVTlXOgwBsTIVieEVJD.bNPyDeTbTLZlyoulf4BDQ38t5e0v0flXo2UxPbVUMmt3YZ1hBH.ld1sbMd96lrnY-" -d ${COMFY_HOME}/models/upscale_models -o 4x_NMKD-Superscale-SP_178000_G.pth


# python ${COMFY_HOME}/main.py --listen --port 1991
#python ${COMFY_HOME}/main.py --dont-print-server