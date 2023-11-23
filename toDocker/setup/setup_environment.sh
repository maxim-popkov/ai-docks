#!/bin/bash
# Load ENVs from .env and update .bashrc

# Path to .env
ENV_FILE="/home/popkov-mi/.env"

# Check .env
if [ -f "$ENV_FILE" ]; then
    set -a #Auto export all variables
    source $ENV_FILE
    set +a
else 
    echo "Файл .env не найден"
fi

# Add line to .bashrc for auto load envs from .env
echo "if [ -f \"$ENV_FILE\" ]; then set -a; source $ENV_FILE; set +a; fi" >> /home/popkov-mi/.bashrc

# Modify LD_LIBRARY_PATH
echo "export LD_LIBRARY_PATH=/usr/local/cuda-11.4/targets/x86_64-linux/lib:/usr/lib/x86_64-linux-gnu:/home/popkov-mi/miniconda3/envs/art-env/lib:\$LD_LIBRARY_PATH" >> /home/popkov-mi/.bashrc

# Update .bashrc
source /home/popkov-mi/.bashrc
