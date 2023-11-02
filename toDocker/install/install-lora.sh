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


sed -i "s@cpu@cuda@" library/model_util.py
# позволяет загружать обрезанные изображения без вызова ошибки
sed -i 's/from PIL import Image/from PIL import Image, ImageFile\nImageFile.LOAD_TRUNCATED_IMAGES=True/g' library/train_util.py # fix truncated jpegs error
# сделать симпотичнее именование эпох
sed -i 's/{:06d}/{:02d}/g' library/train_util.py # make epoch names shorter
sed -i 's/"." + args.save_model_as)/"-{:02d}.".format(num_train_epochs) + args.save_model_as)/g' train_network.py # name of the last epoch will match the rest
