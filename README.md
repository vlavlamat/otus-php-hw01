# 🐳 Домашнее задание №1 — Окружение на Docker

## ✨ Цель

* Познакомиться с различными типами организации окружения.
* Осознать применимость и необходимость каждого подхода.
* Научиться настраивать рабочее окружение PHP-проекта с помощью Docker Compose.
* Автоматизировать запуск и остановку инфраструктуры.

---

## ⚙️ Состав окружения

В проекте используются следующие сервисы:

* **nginx** — обрабатывает статику и проксирует PHP-запросы в php-fpm
* **php-fpm** — исполняет PHP-скрипты, соединяется с nginx через unix-сокет (или TCP в базовой версии)
* **postgres** — СУБД для хранения данных
* **redis** — кеширование и хранение сессий
* **memcached** — кеширование
* **adminer** *(только dev)* — web-интерфейс для управления БД

Конфигурационные файлы и данные вынесены в отдельные директории и тома.

## 🛠️ Подготовка окружения

1. Скопируйте файл `.env.example` в `.env`:
```bash
cp .env.example .env
```
2. Откройте файл `.env` и **добавьте свои тестовые данные** вместо пустых значений.
   Например:
```
POSTGRES_DB=otus_php_hw01
POSTGRES_USER=student
POSTGRES_PASSWORD=secret
POSTGRES_ALLOW_EMPTY_PASSWORD=no

ADMINER_DEFAULT_SERVER=postgres

NGINX_PORT=8000
```
---

> 💡 **Совет:** Для удобства можно использовать готовые скрипты из папки `scripts/`:
>
> * `scripts/dev-build.sh` — сборка и запуск окружения для разработки
> * `scripts/dev-up.sh` — запуск без сборки
> * `scripts/dev-down.sh` — остановка dev-окружения
> * `scripts/prod-build.sh` — сборка и запуск production-окружения
> * `scripts/prod-up.sh` — запуск без сборки
> * `scripts/prod-down.sh` — остановка production-окружения
>
Для этого перейдите в папку `scripts`:
```bash
 cd scripts
```
И запустите нужный вам скрипт
```bash
./dev-build.sh   # или любой другой нужный скрипт
```
### Стандартный запуск окружения в development-режиме
```bash
docker compose -f docker-compose.yml -f docker-compose.dev.yml up --build -d
```
В дальнейшем, после первого запуска с флагом `--build`, можно запускать контейнеры без пересборки:
```bash
docker compose -f docker-compose.yml -f docker-compose.dev.yml up -d
```
**Остановка:**
```bash
docker compose -f docker-compose.yml -f docker-compose.dev.yml down
```
---
### Стандартный запуск окружения в production-режиме
```bash
docker compose -f docker-compose.yml -f docker-compose.prod.yml up --build -d
```
В дальнейшем, после первого запуска с флагом `--build`, можно запускать контейнеры без пересборки:
```bash
docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```
**Остановка:**
```bash
docker compose -f docker-compose.yml -f docker-compose.prod.yml down
```
**Удаление томов (БД и кеш):**
```bash
docker compose -f docker-compose.yml -f docker-compose.prod.yml down -v
```
---
## 📚 Примечания

* В dev-режиме используется Adminer на порту 8080.
* Связь между nginx и FPM настроена через unix-сокет.
* Для production-сборки используются образы, заранее собранные из `Dockerfile` проекта (nginx и php), и опубликованные под тегами `otus-php-hw01/nginx:latest` и `otus-php-hw01/php-fpm:latest`. Это позволяет запускать production-окружение без необходимости пересборки контейнеров.
* Используются последние стабильные версии PHP (8.3-fpm), nginx, Redis, Memcached и PostgreSQL.
* Composer предустановлен в php-контейнере.
---
## 📝 Проверка работы

* Откройте http://localhost:*PORT*, где *PORT* — это значение переменной `NGINX_PORT` из вашего файла `.env`.  
   По умолчанию, если порт не указан, нужно использовать http://localhost:8000.  
   Проверьте, отображаются ли сообщения от всех сервисов (БД, Redis, Memcached). 
* Откройте [http://localhost:8080](http://localhost:8080) — убедитесь, что работает Adminer (dev).
* Посмотреть логи:
```bash
    docker compose logs -f
```