#!/bin/bash
# Создание необходимых директорий и установка прав доступа

# Функция для создания директории и установки прав
create_directory() {
    mkdir -p $1
    chmod 777 $1
    chown popkov-mi:popkov-mi $1
}

# Создаем директории и устанавливаем права
create_directory /home/popkov-mi/.cache
create_directory /home/popkov-mi/miniconda3/envs/art-env
create_directory /home/popkov-mi/sd-app/v1/auto
create_directory /home/popkov-mi/.config
create_directory /home/popkov-mi/.insightface
create_directory /home/popkov-mi/.keras
create_directory /home/popkov-mi/.nv
create_directory /home/popkov-mi/.ifnude
create_directory /home/popkov-mi/.ipython
create_directory /home/popkov-mi/.local
create_directory /home/popkov-mi/sd-app/cn-annotator
create_directory /home/popkov-mi/sd-app/cn15-models
create_directory /home/popkov-mi/sd-app/cn21-models
create_directory /home/popkov-mi/sd-app/sd15-models
create_directory /home/popkov-mi/sd-app/sd21-models
create_directory /home/popkov-mi/sd-app/vae
