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

> **Важно!** Для удобства разработки все тестовые переменные окружения заранее добавлены в файл `.env`, и этот файл включён в репозиторий. Однако в реальных production-сценариях **не рекомендуется** добавлять `.env` в систему контроля версий — вместо этого используйте `.env.example` и настройте `.gitignore` соответствующим образом.

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
> Для этого перейдите в папку `scripts`:
>
> ```bash
>  cd scripts
>  ./dev-build.sh   # или любой другой нужный скрипт
> ```

### Запуск окружения в development-режиме
```bash
    docker compose -f docker-compose.yml -f docker-compose.dev.yml up --build -d
```

В дальнейшем, после первого запуска с флагом `--build`, можно запускать контейнеры без пересборки:

```bash
    docker compose -f docker-compose.yml -f docker-compose.dev.yml up -d
````

* Приложение: [http://localhost:8000](http://localhost:8000)
* Adminer: [http://localhost:8080](http://localhost:8080)

**Остановка:**

```bash
    docker compose -f docker-compose.yml -f docker-compose.dev.yml down
```

---

### Запуск окружения в production-режиме

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
* Связь между nginx и FPM может быть настроена как по TCP, так и через unix-сокет (опционально).
* Для production-сборки используются образы, заранее собранные из `Dockerfile` проекта (nginx и php), и опубликованные под тегами `otus-php-hw01/nginx:latest` и `otus-php-hw01/php-fpm:latest`. Это позволяет запускать production-окружение без необходимости пересборки контейнеров.
* Используются последние стабильные версии PHP (8.3-fpm), nginx, Redis, Memcached и PostgreSQL.
* Composer предустановлен в php-контейнере (опционально).

---

## 📝 Проверка работы

1. Откройте [http://localhost:8000](http://localhost:8000) — проверьте, отображаются ли сообщения от всех сервисов (БД, Redis, Memcached).
2. Откройте [http://localhost:8080](http://localhost:8080) — убедитесь, что работает Adminer (dev).
3. Посмотрите логи:

```bash
    docker compose logs -f
```

---