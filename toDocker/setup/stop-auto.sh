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
    PID_FILE=sd_prod_pidfile.txt
elif [[ $1 == "--test" ]]; then
    PID_FILE=sd_test_pidfile.txt
else
    echo "Не указан режим: --prod или --test"
    exit 1
fi

# Проверяем, существует ли файл
if [ ! -f $HOME/$PID_FILE ]; then
    echo "Файл $PID_FILE не найден!"
    exit 1
fi

# Читаем PID из файла
pid=$(cat $HOME/$PID_FILE)

# Проверяем, запущен ли процесс
if ps -p $pid > /dev/null
then
   echo "Убиваем процесс с PID: $pid"
   kill $pid
else
   echo "Процесс с PID $pid не найден"
fi
