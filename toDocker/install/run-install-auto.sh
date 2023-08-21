#!/bin/bash

# URL файла
FILE_URL="https://raw.githubusercontent.com/maxim-popkov/ai-docks/main/toDocker/install/install-auto.sh"

# Скачиваем файл
curl -o install-auto.sh $FILE_URL

# Даем права на выполнение
chmod +x install-auto.sh

# Запускаем файл
./install-auto.sh
