SD_HOME="/home/popkov-mi/sd-app/v1/auto"
SD_MODELS="/home/popkov-mi/sd-app/sd15-models"
CN_MODELS="/home/popkov-mi/sd-app/cn15-models"
CN_ANNOTATOR="/home/popkov-mi/sd-app/cn-annotator"

conda activate art-env
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git ${SD_HOME}

git clone https://huggingface.co/embed/negative ${SD_HOME}/embeddings/negative
git clone https://huggingface.co/embed/lora ${SD_HOME}/models/Lora/positive


# git clone https://github.com/camenduru/stable-diffusion-webui-images-browser ${SD_HOME}/extensions/stable-diffusion-webui-images-browser
git clone https://github.com/AlUlkesh/stable-diffusion-webui-images-browser ${SD_HOME}/extensions/stable-diffusion-webui-images-browser
# git clone https://github.com/camenduru/stable-diffusion-webui-huggingface ${SD_HOME}/extensions/stable-diffusion-webui-huggingface
# git clone https://github.com/camenduru/sd-civitai-browser ${SD_HOME}/extensions/sd-civitai-browser
git clone https://github.com/Mikubill/sd-webui-controlnet ${SD_HOME}/extensions/sd-webui-controlnet
git clone https://github.com/fkunn1326/openpose-editor ${SD_HOME}/extensions/openpose-editor
git clone https://github.com/camenduru/a1111-sd-webui-locon ${SD_HOME}/extensions/a1111-sd-webui-locon
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg ${SD_HOME}/extensions/stable-diffusion-webui-rembg
git clone https://github.com/ashen-sensored/stable-diffusion-webui-two-shot ${SD_HOME}/extensions/stable-diffusion-webui-two-shot
git clone https://github.com/thomasasfk/sd-webui-aspect-ratio-helper ${SD_HOME}/extensions/sd-webui-aspect-ratio-helper

git clone https://github.com/Iyashinouta/sd-model-downloader ${SD_HOME}/extensions/sd-model-downloader
git clone https://github.com/missionfloyd/webui-qrcode-generator ${SD_HOME}/extensions/webui-qrcode-generator

cd ${SD_HOME}

mv ${SD_HOME}/models/* ${SD_MODELS}/
mv ${SD_HOME}/extensions/sd-webui-controlnet/models/* ${CN_MODELS}/
mv ${SD_HOME}/extensions/sd-webui-controlnet/annotator/* ${CN_ANNOTATOR}/

rm -rf ${SD_HOME}/models
rm -rf ${SD_HOME}/extensions/sd-webui-controlnet/models
rm -rf ${SD_HOME}/extensions/sd-webui-controlnet/annotator

ln -s ${SD_MODELS} ${SD_HOME}/models
ln -s ${CN_MODELS} ${SD_HOME}/extensions/sd-webui-controlnet/models
ln -s ${CN_ANNOTATOR} ${SD_HOME}/extensions/sd-webui-controlnet/annotator

# Model
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/XpucT/Deliberate/resolve/main/Deliberate_v2.safetensors -d ${SD_HOME}/models/Stable-diffusion -o Deliberate_v2.safetensors

# roop
# pip install insightface==0.7.3
# git clone https://github.com/s0md3v/sd-webui-roop ${SD_HOME}/extensions/sd-webui-roop

python -c 'from launch import prepare_environment; prepare_environment()'
