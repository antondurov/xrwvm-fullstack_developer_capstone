default: run

# List all available recipes
list:
    @just --list

# Build the frontend, then launch the full app on http://localhost:8000
run: build-frontend
    cd server && .venv/bin/python manage.py migrate --noinput
    cd server && .venv/bin/python manage.py collectstatic --noinput
    cd server && .venv/bin/python manage.py runserver

# Install every dependency the project needs (Python venv + both Node services)
bootstrap: bootstrap-backend bootstrap-frontend bootstrap-database

# Create Python venv and install Django backend requirements
bootstrap-backend:
    cd server && python3 -m venv .venv
    cd server && .venv/bin/pip install --upgrade pip
    cd server && .venv/bin/pip install -r requirements.txt

# Install React frontend deps
bootstrap-frontend:
    cd server/frontend && npm install

# Install Node "database" microservice deps
bootstrap-database:
    cd server/database && npm install

# ─── Run services ─────────────────────────────────────────────────────────

# Django backend on http://localhost:8000
backend:
    cd server && .venv/bin/python manage.py migrate --noinput
    cd server && .venv/bin/python manage.py runserver

# Build the React frontend for production (output: server/frontend/build)
build-frontend:
    cd server/frontend && npm run build

# React dev server with hot-reload on http://localhost:3000 (SPA routes only — see README)
frontend:
    cd server/frontend && npm run build
    cd server/frontend && npm start

# Node dealership API on http://localhost:3030 (needs MongoDB)
database:
    cd server/database && node app.js

# MongoDB + Node API together via docker compose (recommended)
db-up:
    cd server/database && docker compose up -d

db-down:
    cd server/database && docker compose down

# Standalone MongoDB only (port 27017)
mongo:
    docker run --rm -d --name mongo_db -p 27017:27017 mongo:latest

mongo-stop:
    docker stop mongo_db

# ─── Django helpers ───────────────────────────────────────────────────────

migrate:
    cd server && .venv/bin/python manage.py makemigrations
    cd server && .venv/bin/python manage.py migrate

createsuperuser:
    cd server && .venv/bin/python manage.py createsuperuser

collectstatic:
    cd server && .venv/bin/python manage.py collectstatic --noinput

# ─── Docker (production-like) ─────────────────────────────────────────────

docker-build:
    cd server && docker build -t dealership .

docker-run:
    docker run --rm -p 8000:8000 dealership

# ─── Cleanup ──────────────────────────────────────────────────────────────

clean-venv:
    rm -rf server/.venv

clean-node:
    rm -rf server/frontend/node_modules server/database/node_modules

clean: clean-venv clean-node
