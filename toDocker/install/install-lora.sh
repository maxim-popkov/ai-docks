#!/bin/bash
source .env
conda activate art-env

LORA_TRAINER="/home/popkov-mi/lora-trainer"
COMMIT="9a67e0df390033a89f17e70df5131393692c2a55"

git clone https://github.com/kohya-ss/sd-scripts ${LORA_TRAINER}
cd ${LORA_TRAINER}
git reset --hard ${COMMIT}

wget https://raw.githubusercontent.com/hollowstrawberry/kohya-colab/xformers-fix/requirements.txt -q -O requirements.txt

pip install --upgrade -r requirements.txt
pip install xformers==0.0.22.post4 --index-url https://download.pytorch.org/whl/cu118
