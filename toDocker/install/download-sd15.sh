source .env

# delibirate
aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/XpucT/Deliberate/resolve/main/Deliberate_v2.safetensors -d ${SD_HOME}/models/Stable-diffusion -o Deliberate_v2.safetensors
