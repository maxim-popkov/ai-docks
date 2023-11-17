#!/bin/bash
# Загрузка переменных окружения из .env файла и обновление .bashrc

# Путь к .env файлу
ENV_FILE="/home/popkov-mi/.env"

# Проверяем, существует ли файл .env
if [ -f "$ENV_FILE" ]; then
    # Загружаем переменные из .env файла
    set -a # Автоматически экспортировать все переменные
    source $ENV_FILE
    set +a
else 
    echo "Файл .env не найден"
fi

# Добавляем строку в .bashrc для автоматической загрузки переменных из .env файла
echo "if [ -f \"$ENV_FILE\" ]; then set -a; source $ENV_FILE; set +a; fi" >> /home/popkov-mi/.bashrc

# Добавляем пути к LD_LIBRARY_PATH
echo "export LD_LIBRARY_PATH=/usr/local/cuda-11.4/targets/x86_64-linux/lib:/usr/lib/x86_64-linux-gnu:/home/popkov-mi/miniconda3/envs/art-env/lib:\$LD_LIBRARY_PATH" >> /home/popkov-mi/.bashrc

# Обновляем .bashrc
source /home/popkov-mi/.bashrc
