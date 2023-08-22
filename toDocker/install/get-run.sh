#!/bin/bash

# Проверка на наличие аргумента
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <script_name>"
    exit 1
fi

# Имя файла из аргумента
SCRIPT_NAME=$1

# URL файла
BASE_URL="https://raw.githubusercontent.com/maxim-popkov/ai-docks/main/toDocker/install"
FILE_URL="$BASE_URL/$SCRIPT_NAME"

# Скачиваем файл
curl -o $SCRIPT_NAME $FILE_URL

# Проверяем успешность скачивания
if [ $? -ne 0 ]; then
    echo "Error downloading the script. Please check the script name and try again."
    exit 2
fi

# Даем права на выполнение
chmod +x $SCRIPT_NAME

# Запускаем файл
./$SCRIPT_NAME
