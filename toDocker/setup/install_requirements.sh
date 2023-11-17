#!/bin/bash
# Установка cudatoolkit и создание символических ссылок

# Устанавливаем cudatoolkit
mamba install -y cudatoolkit

# Создаем символическую ссылку для libstdc++.so.6
ln -sf /home/popkov-mi/miniconda3/envs/art-env/lib/libstdc++.so.6 /usr/lib/x86_64-linux-gnu/libstdc++.so.6
chattr +i /usr/lib/x86_64-linux-gnu/libstdc++.so.6