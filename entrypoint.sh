#!/bin/bash

# Входим в виртуальное окружение
source /home/username/project_root/venv/bin/activate

# Переходим в директорию проекта
cd /home/username/project_root

# Если PORT не задан, берем 8000
PORT=${PORT:-8000}

# Запуск Gunicorn
exec gunicorn garden_site.wsgi:application \
    --bind 0.0.0.0:$PORT \
    --workers 3 \
    --timeout 120 \
    --log-level debug
