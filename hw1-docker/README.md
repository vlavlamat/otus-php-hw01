# Настройка окружения на Docker

## 📦 Описание

Этот каталог содержит окружение на базе Docker для выполнения домашнего задания №1.
Цель — развернуть и запустить контейнеризированное окружение для разработки на PHP с использованием `docker-compose`.

## 📁 Используемые сервисы

* **nginx** — обслуживает статические файлы и проксирует PHP-скрипты в PHP-FPM
* **php-fpm** — обрабатывает выполнение PHP-скриптов
* **redis** — хранилище данных в памяти (кеширование)
* **memcached** — альтернативная система кеширования
* **mysql/postgres** — база данных (конфигурация будет добавлена)

## ⚙️ Как запустить

1. Клонируйте репозиторий и переключитесь на ветку Docker:

   ```bash
   git checkout VM/hw1-docker
   cd hw1-docker
   ```

2. Скопируйте файл с переменными окружения (если есть):

   ```bash
   cp .env.example .env
   ```

3. Соберите и запустите контейнеры:

   ```bash
   docker compose up -d --build
   ```

4. Откройте приложение в браузере:

   ```
   http://localhost
   ```

5. (Опционально) Выполните Composer внутри контейнера:

   ```bash
   docker compose exec php composer install
   ```

## 🛑 Как остановить окружение

```bash
    docker compose down
```

## 🧹 Как удалить тома (опционально)

```bash
    docker compose down -v
```

## 📝 Примечания

* Убедитесь, что Docker установлен и запущен на вашей машине.
* Том базы данных сохраняется в директории `data/` для постоянства данных.
* Логи сервисов сохраняются в `docker/.../*.log` и игнорируются Git'ом.

---


# Docker Environment Setup

## 📦 Description

This directory contains the Docker-based environment for Homework 1.
The goal is to build and run a containerized PHP development environment using `docker-compose`.

## 📁 Included Services

* **nginx** – serves static files and proxies PHP scripts to PHP-FPM
* **php-fpm** – executes PHP scripts
* **redis** – in-memory key-value store for caching
* **memcached** – alternative caching system
* **mysql/postgres** – database container (to be configured)

## ⚙️ How to Run

1. Clone the repository and switch to the Docker branch:

   ```bash
   git checkout VM/hw1-docker
   cd hw1-docker
   ```

2. Copy the environment file template (if present):

   ```bash
   cp .env.example .env
   ```

3. Build and start the containers:

   ```bash
   docker compose up -d --build
   ```

4. Access the application in your browser:

   ```
   http://localhost
   ```

5. (Optional) Run Composer inside the container:

   ```bash
   docker compose exec php composer install
   ```

## 🛑 How to Stop

```bash
    docker compose down
```

## 🧹 How to Clean Volumes (optional)

```bash
    docker compose down -v
```

## 📝 Notes

* Make sure Docker is installed and running on your system.
* Database volumes are mapped to `data/` directories for persistence.
* Logs are written to `docker/.../*.log` (ignored by Git).
