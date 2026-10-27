FROM python:3.12-slim

# Настройка переменных окружения
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Установка рабочей директории
WORKDIR /app

# Установка необходимых системных зависимостей (при необходимости)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Копирование зависимостей и их установка
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Копирование исходного кода проекта
COPY . /app/

# Настройка прав на выполнение скрипта start.sh
RUN chmod +x /app/start.sh

# Точка входа в контейнер
ENTRYPOINT ["/app/start.sh"]