# mkdir /home/popkov-mi/sd-app/sd15-models/SadTalker
# cd /home/popkov-mi/sd-app/sd15-models/SadTalker
# bash <(wget -qO- https://raw.githubusercontent.com/Winfredy/SadTalker/main/scripts/download_models.sh)

conda install -y ffmpeg
git clone https://github.com/Winfredy/SadTalker ${SD_HOME}/extensions/SadTalker

# cp ${SD_HOME}/extensions/SadTalker/scripts/download_models.sh ${SD_HOME}/extensions/SadTalker/

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
