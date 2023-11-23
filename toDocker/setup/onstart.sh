#!/bin/bash
HOME_DIR="/home/popkov-mi"

# check install_requirements.sh and run it
if [ -f "${HOME_DIR}/install_requirements.sh" ]; then
    echo "Запуск install_requirements.sh..."
    bash "${HOME_DIR}/install_requirements.sh"
else
    echo "Скрипт install_requirements.sh не найден."
fi
