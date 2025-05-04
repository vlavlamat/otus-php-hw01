# Домашнее задание: Работа с окружением

## 📚 Цель

- Познакомиться с различными типами организации окружения
- Осознать их применимость и необходимость
- Научиться настраивать рабочее окружение для своих проектов с использованием автоматизации

## 🧩 Описание задания

Задание предполагает реализацию **двух изолированных окружений**:

### 1. Docker (основное задание)

- Установить Docker на локальную машину
- Описать инфраструктуру в `docker-compose`, которая включает:
    - `nginx` — обрабатывает статику, пробрасывает выполнение скриптов в FPM
    - `php-fpm` — соединяется с nginx через TCP-порт
    - `redis` — соединяется с PHP по порту
    - `memcached` — соединяется с PHP по порту
    - БД (MySQL/PostgreSQL) — соединяется по порту, с поддержкой volume для хранения данных
- (*) Дополнительно: установить Composer
- (*) Дополнительно: соединить FPM и nginx через Unix-сокет

### 2. Виртуальные машины (дополнительное задание)

- Развернуть Homestead VM при помощи Vagrant и VirtualBox
- Настроить сайт так, чтобы он был доступен по домену `application.local`
- Обеспечить проброс директорий между хостом и гостевой машиной

## 🗂️ Структура проекта

- `hw1-docker/` — реализация задания на базе Docker
- `hw1-vagrant/` — реализация задания с использованием Vagrant + Homestead

## 🧭 Ветки Git

- `VM/hw1-docker` — содержит окружение на Docker
- `VM/hw1-vagrant` — содержит окружение на Vagrant (Homestead)

## 🔧 Как использовать

Перейдите в нужную ветку и следуйте инструкциям в соответствующем `README.md` внутри:

- `hw1-docker/README.md`
- `hw1-vagrant/README.md`

## 📌 Критерии оценки

- Каждый `RUN` в Dockerfile создаёт промежуточный слой — минимизируйте их количество
- Docker — **основная часть задания**

---

# Homework: Environment Setup

## 📚 Objective

- Get familiar with different types of environment setup
- Understand when and why each is used
- Learn how to automate project environment configuration

## 🧩 Task Overview

This assignment requires creating **two isolated environments**:

### 1. Docker (main task)

- Install Docker on your local machine
- Describe infrastructure using `docker-compose` including:
    - `nginx` — serves static files and forwards PHP scripts to FPM
    - `php-fpm` — connects to nginx via TCP
    - `redis` — connects to PHP via port
    - `memcached` — connects to PHP via port
    - A database (MySQL/PostgreSQL) — connects via port and uses volumes for persistent data
- (*) Optionally: install Composer
- (*) Optionally: connect FPM and nginx using a Unix socket

### 2. Virtual machines (optional task)

- Deploy Homestead VM using Vagrant and VirtualBox
- Configure the site to respond to the domain `application.local`
- Ensure folder sharing between host and guest

## 🗂️ Project Structure

- `hw1-docker/` — Docker-based environment
- `hw1-vagrant/` — Vagrant + Homestead environment

## 🧭 Git Branches

- `VM/hw1-docker` — contains Docker environment
- `VM/hw1-vagrant` — contains Vagrant (Homestead) environment

## 🔧 How to Use

Switch to the desired branch and follow the instructions in the corresponding `README.md`:

- `hw1-docker/README.md`
- `hw1-vagrant/README.md`

## 📌 Evaluation Criteria

- Each `RUN` instruction in Dockerfile creates a layer — minimize them when possible
- Docker is the **main focus** of this task
