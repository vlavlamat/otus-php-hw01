#!/bin/bash
cd "$(dirname "$0")/.." || exit 1
docker compose -f docker-compose.yml -f docker-compose.prod.yml up -d