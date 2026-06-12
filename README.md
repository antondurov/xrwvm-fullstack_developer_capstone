# Fullstack Developer Capstone — Dealership Reviews

A car dealership reviews application built as a multi-service fullstack project:

- **Django backend** (`server/`) — main web app & API gateway, runs on port `8000`
- **Node.js dealership microservice** (`server/database/`) — Express + MongoDB, serves dealer and review data on port `3030`
- **React frontend** (`server/frontend/`) — user-facing UI on port `3000`
- **MongoDB** — persistence for the Node microservice, port `27017`

The Django backend proxies dealership/review reads to the Node microservice (see `server/djangoapp/restapis.py`) and owns user auth, sessions, and the rest of the UI integration.

## Quickstart

This repo uses [`just`](https://github.com/casey/just) as a task runner so first-time setup is one command.

### 2. Prerequisites

- **Python 3.10+** (the Dockerfile uses 3.12)
- **Node.js 18+** and **npm**
- **Docker** (only needed for MongoDB / the Node service via compose)

### 3. Bootstrap everything

```bash
just bootstrap
```

This installs Python deps into `server/.venv`, then runs `npm install` for both the React frontend and the Node database microservice.

### 4. Run the services

Open three terminals (or use a multiplexer):

```bash
just db-up    # MongoDB + Node dealership API (via docker compose)
just backend     # Django on http://localhost:8000
just frontend    # React on http://localhost:3000
```

Then visit <http://localhost:3000>.
## Project structure

```
xrwvm-fullstack_developer_capstone/
├── justfile                    # dev task runner
├── server/
│   ├── manage.py               # Django entry point
│   ├── requirements.txt        # Django deps
│   ├── Dockerfile              # Django + gunicorn image
│   ├── entrypoint.sh           # migrations + collectstatic on container start
│   ├── deployment.yaml         # Kubernetes deployment manifest
│   ├── djangoproj/             # Django project settings, urls, wsgi
│   ├── djangoapp/              # Main Django app (views, models, restapis)
│   ├── database/               # Node.js Express + MongoDB microservice
│   │   ├── app.js
│   │   ├── dealership.js / review.js / inventory.js
│   │   └── docker-compose.yml  # MongoDB + Node API
│   └── frontend/               # React SPA
│       ├── src/
│       └── public/
└── README.md
```

## Deployment

- The Django service has a `Dockerfile` (`server/Dockerfile`) that runs `gunicorn` on port `8000` and a Kubernetes manifest (`server/deployment.yaml`).
- The Node microservice is brought up alongside MongoDB via `server/database/docker-compose.yml`.

## 🛠️ Technologies Used

### Frontend Stack
- React 18.2.0
- React Router DOM 6.19.0
- React Scripts 5.0.1
- Testing Library (Jest, React)

### Backend Stack
- Express.js 4.18.2
- MongoDB 6.3.0
- Mongoose 8.0.1
- CORS 2.8.5

### Other
- Apache License 2.0
- Git version control

## 👨‍💻 Development Workflow

1. Start the backend server from `server/database`
2. Start the frontend dev server from `server/frontend`
3. Access the application at `http://localhost:3000`
4. Backend API typically runs on `http://localhost:5000` (or configured port)

## 📝 License

This project is licensed under the [Apache License 2.0](LICENSE)

## 🤝 Contributing

Feel free to fork this repository and submit pull requests for any improvements.

## 📞 Support

For issues or questions about this project, please open an issue on GitHub.

---

**Last Updated**: May 15, 2026
