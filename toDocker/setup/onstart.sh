#!/bin/bash
HOME_DIR="/home/popkov-mi"

# Проверяем, существует ли скрипт install_requirements.sh и запускаем его
if [ -f "${HOME_DIR}/install_requirements.sh" ]; then
    echo "Запуск install_requirements.sh..."
    bash "${HOME_DIR}/install_requirements.sh"
else
    echo "Скрипт install_requirements.sh не найден."
fi
