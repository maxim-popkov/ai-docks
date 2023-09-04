conda install -y cudatoolkit
pip uninstall -y bitsandbytes
pip install auto-gptq
pip install -q -U trl transformers accelerate git+https://github.com/huggingface/peft.git
pip install -q datasets einops
pip install -q bitsandbytes
