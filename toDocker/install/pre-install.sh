# export LD_LIBRARY_PATH=/home/popkov-mi/miniconda3/envs/art-env/lib:$LD_LIBRARY_PATH
# нужно для работы curl \ git и для работы bitsandbytes +cudatoolkit
#!/bin/bash

# Устанавливаем переменные окружения
SD_HOME="/home/popkov-mi/sd-app/v1/auto"
SD_MODELS="/home/popkov-mi/sd-app/sd15-models"
CN_MODELS="/home/popkov-mi/sd-app/cn15-models"
CN_ANNOTATOR="/home/popkov-mi/sd-app/cn-annotator"

# Добавляем пути к LD_LIBRARY_PATH
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-11.4/targets/x86_64-linux/lib:/usr/lib/x86_64-linux-gnu:/home/popkov-mi/miniconda3/envs/art-env/lib:$LD_LIBRARY_PATH' >> /home/popkov-mi/.bashrc

# Создаем символическую ссылку для libstdc++.so.6
ln -sf /home/popkov-mi/miniconda3/envs/art-env/lib/libstdc++.so.6 /usr/lib/x86_64-linux-gnu/libstdc++.so.6

# Устанавливаем cudatoolkit
conda install -y cudatoolkit

# Создаем файл .env и добавляем переменные окружения
cat <<EOL > /home/popkov-mi/.env
SD_HOME=$SD_HOME
SD_MODELS=$SD_MODELS
CN_MODELS=$CN_MODELS
CN_ANNOTATOR=$CN_ANNOTATOR
EOL

# Обновляем .bashrc
source /home/popkov-mi/.bashrc

# Проверяем, успешно ли выполнились команды
if [ $? -ne 0 ]; then
    echo "Ошибка при выполнении скрипта."
    exit 1
fi

echo "Скрипт успешно выполнен."
