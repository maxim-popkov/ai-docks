APP_DIR="/app"

#conda activate art-env
git clone https://github.com/bmaltais/kohya_ss.git ${APP_DIR}
cd kohya_ss
mkdir -p ${APP_DIR}/dataset/100_marks

aria2c --console-log-level=error -c -x 16 -s 16 -k 1M "https://huggingface.co/XpucT/Deliberate/resolve/main/Deliberate_v2.safetensors" -d ${APP_DIR}/sd15-models -o Deliberate_v2.safetensors


chmod +x ./setup.sh
./setup.sh

# run
# ./gui.sh --listen 0.0.0.0 --server_port 1991

# Path
# /home/popkov-mi/kohya_ss/config_files/LoRA.json
# /app/sd15-models/Deliberate_v2.safetensors

# /app/dataset/