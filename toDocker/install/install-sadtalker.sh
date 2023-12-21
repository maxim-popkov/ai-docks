#!/bin/bash
source .env
SAD_HOME=${SD_HOME}/extensions/SadTalker

conda install -y ffmpeg
git clone https://github.com/Winfredy/SadTalker ${SD_HOME}/extensions/SadTalker
# cp ${SD_HOME}/extensions/SadTalker/scripts/download_models.sh ${SD_HOME}/extensions/SadTalker/
# vi ${SD_HOME}/extensions/SadTalker/download_models.sh
# cd ${SD_HOME}/extensions/SadTalker
# chmod +x ${SD_HOME}/extensions/SadTalker/download_models.sh
mkdir ${SAD_HOME}/checkpoints 
wget -nc https://github.com/Winfredy/SadTalker/releases/download/v0.0.2/auido2exp_00300-model.pth -O ${SAD_HOME}/checkpoints/auido2exp_00300-model.pth
wget -nc https://github.com/Winfredy/SadTalker/releases/download/v0.0.2/auido2pose_00140-model.pth -O ${SAD_HOME}/checkpoints/auido2pose_00140-model.pth
wget -nc https://github.com/Winfredy/SadTalker/releases/download/v0.0.2/epoch_20.pth -O ${SAD_HOME}/checkpoints/epoch_20.pth
wget -nc https://github.com/Winfredy/SadTalker/releases/download/v0.0.2/facevid2vid_00189-model.pth.tar -O ${SAD_HOME}/checkpoints/facevid2vid_00189-model.pth.tar
wget -nc https://github.com/Winfredy/SadTalker/releases/download/v0.0.2/shape_predictor_68_face_landmarks.dat -O ${SAD_HOME}/checkpoints/shape_predictor_68_face_landmarks.dat
wget -nc https://github.com/Winfredy/SadTalker/releases/download/v0.0.2/wav2lip.pth -O ${SAD_HOME}/checkpoints/wav2lip.pth
wget -nc https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/mapping_00109-model.pth.tar -O  ${SAD_HOME}/checkpoints/mapping_00109-model.pth.tar
wget -nc https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/mapping_00229-model.pth.tar -O  ${SAD_HOME}/checkpoints/mapping_00229-model.pth.tar
wget -nc https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/SadTalker_V0.0.2_256.safetensors -O  ${SAD_HOME}/checkpoints/SadTalker_V0.0.2_256.safetensors
wget -nc https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/SadTalker_V0.0.2_512.safetensors -O  ${SAD_HOME}/checkpoints/SadTalker_V0.0.2_512.safetensors

mkdir -p ${SAD_HOME}/gfpgan/weights
wget -nc https://github.com/xinntao/facexlib/releases/download/v0.1.0/alignment_WFLW_4HG.pth -O ${SAD_HOME}/gfpgan/weights/alignment_WFLW_4HG.pth 
wget -nc https://github.com/xinntao/facexlib/releases/download/v0.1.0/detection_Resnet50_Final.pth -O ${SAD_HOME}/gfpgan/weights/detection_Resnet50_Final.pth 
wget -nc https://github.com/TencentARC/GFPGAN/releases/download/v1.3.0/GFPGANv1.4.pth -O ${SAD_HOME}/gfpgan/weights/GFPGANv1.4.pth 
wget -nc https://github.com/xinntao/facexlib/releases/download/v0.2.2/parsing_parsenet.pth -O ${SAD_HOME}/gfpgan/weights/parsing_parsenet.pth 


# chown -R popkov-mi:popkov-mi /home/popkov-mi/sd-app/v1/auto
# chmod -R 700 /home/popkov-mi/sd-app/v1/auto


# wget https://download.pytorch.org/whl/cu118/torchaudio-2.0.2%2Bcu118-cp310-cp310-linux_x86_64.whl


#python launch.py --listen --port 1991 --enable-insecure-extension-access 

# We have tested it before, and the TTS might not work well in different operation systems, so we remove it. For installation, if you are a Linux user, try to add TTS Here:
# https://github.com/Winfredy/SadTalker/blob/1cde03deba865c5b65a03849716170360d5f1d71/scripts/extension.py#L47-L49
# after line 48:
# by

# https://github.com/Winfredy/SadTalker/

# "TTS": "tts",
