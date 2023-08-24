conda install cudatoolkit
pip install auto-gptq
pip install -q -U trl transformers accelerate git+https://github.com/huggingface/peft.git
pip install -q datasets einops
pip uninstall bitsandbytes
pip install -q bitsandbytes
