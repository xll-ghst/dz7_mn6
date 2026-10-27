#!/bin/bash

# Прекратить выполнение при возникновении ошибки
set -e

echo "Создание и применение миграций..."
python manage.py makemigrations
python manage.py migrate

echo "Сбор статических файлов..."
python manage.py collectstatic --noinput

echo "Запуск сервера Django..."
python manage.py runserver 0.0.0.0:8000