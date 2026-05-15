# Fullstack Developer Capstone

A comprehensive fullstack web application project demonstrating modern web development practices with React frontend, Node.js/Express backend, and MongoDB database.

## 📋 Project Overview

This capstone project is a user management system that showcases a complete fullstack development workflow. It combines a React-based frontend with an Express.js backend API and MongoDB database to create a scalable, production-ready application.

## 🏗️ Project Architecture

### Frontend (`server/frontend`)
- **Framework**: React 18.2.0
- **Router**: React Router DOM 6.19.0
- **Build Tool**: Create React App
- **Testing**: Jest with React Testing Library
- **Purpose**: User management interface with routing capabilities

### Backend (`server/database`)
- **Runtime**: Node.js
- **Server**: Express.js 4.18.2
- **Database Driver**: MongoDB 6.3.0 with Mongoose 8.0.1 ODM
- **Middleware**: CORS enabled for frontend communication
- **Purpose**: RESTful API for user management operations

### Server Configuration (`server`)
- **Package Name**: server
- **License**: ISC
- **Dependencies**: Integration with Django framework reference

## 🚀 Getting Started

### Prerequisites
- Node.js (v14 or higher)
- npm (v6 or higher)
- MongoDB (local or cloud instance)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/antondurov/xrwvm-fullstack_developer_capstone.git
   cd xrwvm-fullstack_developer_capstone
   ```

2. **Install backend dependencies**
   ```bash
   cd server/database
   npm install
   ```

3. **Install frontend dependencies**
   ```bash
   cd ../frontend
   npm install
   ```

## 📦 Available Scripts

### Frontend (`server/frontend`)

- **`npm start`** - Runs the React app in development mode
  - Open [http://localhost:3000](http://localhost:3000) to view it in the browser
  - Page will reload when changes are made

- **`npm run build`** - Builds the app for production
  - Output in the `build` folder
  - Minified and optimized for best performance

- **`npm test`** - Launches the test runner in interactive watch mode

- **`npm run eject`** - Ejects from Create React App (one-way operation)

### Backend (`server/database`)

- **`npm start`** - Starts the Express server
- **`npm test`** - Runs available tests

## 💾 Database

**MongoDB Configuration**
- Uses Mongoose as the ODM (Object Document Mapper)
- Enables connection to MongoDB local instance or MongoDB Atlas

**CORS Setup**
- Configured to allow requests from the React frontend
- Enables secure cross-origin communication

## 🔗 API Integration

The frontend communicates with the backend API through:
- Express.js RESTful endpoints
- CORS middleware for browser requests
- JSON data exchange

## 📁 Project Structure

```
xrwvm-fullstack_developer_capstone/
├── server/
│   ├── database/          # Backend API server
│   │   ├── app.js
│   │   ├── package.json
│   │   └── node_modules/
│   ├── frontend/          # React frontend
│   │   ├── src/
│   │   ├── public/
│   │   ├── package.json
│   │   └── node_modules/
│   └── package.json
└── README.md
```

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
