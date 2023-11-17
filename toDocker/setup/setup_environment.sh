#!/bin/bash
# Загрузка переменных окружения из .env файла

source /home/popkov-mi/.env

# Добавляем пути к LD_LIBRARY_PATH
echo "export LD_LIBRARY_PATH=/usr/local/cuda-11.4/targets/x86_64-linux/lib:/usr/lib/x86_64-linux-gnu:/home/popkov-mi/miniconda3/envs/art-env/lib:\$LD_LIBRARY_PATH" >> /home/popkov-mi/.bashrc

# Обновляем .bashrc
source /home/popkov-mi/.bashrc
