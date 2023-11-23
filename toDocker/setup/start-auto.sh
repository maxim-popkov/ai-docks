#!/bin/bash

# Загрузка переменных окружения из .env файла
source .env

# Определяем пути для prod и test
if [ "$PROD" == "v1" ]; then
    PROD_PATH=/home/popkov-mi/sd-app/v1/auto
    TEST_PATH=/home/popkov-mi/sd-app/v2/auto
else
    PROD_PATH=/home/popkov-mi/sd-app/v2/auto
    TEST_PATH=/home/popkov-mi/sd-app/v1/auto
fi

# Проверка аргументов
if [[ $1 == "--prod" ]]; then
    SD_PATH=$PROD_PATH
    PORT=1991 # Пример порта для prod
    LOG_FILE=sd_prod.log
    PID_FILE=sd_prod_pidfile.txt
elif [[ $1 == "--test" ]]; then
    SD_PATH=$TEST_PATH
    PORT=1992 # Пример порта для test
    LOG_FILE=sd_test.log
    PID_FILE=sd_test_pidfile.txt
else
    echo "Не указан режим: --prod или --test"
    exit 1
fi

# Запуск приложения
cd $SD_PATH
source /home/popkov-mi/miniconda3/etc/profile.d/conda.sh

conda activate art-env
nohup python -u $SD_PATH/webui.py --listen --port $PORT \
             --theme dark \
             --xformers --no-download-sd-model \
             --skip-version-check > $HOME/$LOG_FILE 2>&1 & echo $!> $HOME/$PID_FILE

echo "sd web ui started with PID $(cat $HOME/$PID_FILE)"
echo "sd web ui: http://10.49.218.177:$PORT"
