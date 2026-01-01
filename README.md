# 🏋️ Exercise Challenge App

Welcome to the **Exercise Challenge App**!  
This is a full-stack fitness application where users can take **30 / 60 / 90 day** or **custom exercise challenges**, complete daily workouts, and track their progress securely.

The project uses **Flutter** for the frontend and **Node.js + MongoDB** for the backend.

---

## ✨ Features

- 🔐 User Authentication (Login / Signup)
- 🏃 30 / 60 / 90 Day Exercise Challenges
- 🧩 Custom Challenge (User-defined days)
- 📆 Day-wise Workout Tracking
- 🎥 Exercise GIF Animations
- ✅ Completed Days Marked
- 📊 Progress & Fitness Reports
- 🔄 Resume Challenge After Restart
- 🌙 Clean Dark UI

---

## 🛠️ Tech Stack

### Frontend
- Flutter (Dart)
- Material UI

### Backend
- Node.js
- Express.js
- MongoDB
- JWT Authentication

---

## 🚀 Install Locally

### Clone Repository
```bash
git clone <your-repo-url>
cd exercise-challenge-app



## Backend Setup

cd backend
npm install

Remove .example from .env.example
Add required values in .env

npm run dev
npm start

##Frontend Setup

cd frontend
flutter pub get
flutter run
```
---
## 📁 Directory Structure
```bash
Exercise-Challenge-App/
├── README.md
├── backend/
│   ├── server.js
│   ├── package.json
│   ├── .env.example
│   ├── config/
│   │   └── db.js
│   ├── controllers/
│   │   ├── authController.js
│   │   ├── profileController.js
│   │   └── progressController.js
│   ├── middleware/
│   │   └── authMiddleware.js
│   ├── models/
│   │   ├── User.js
│   │   └── Progress.js
│   └── routes/
│       ├── authRoutes.js
│       ├── profileRoutes.js
│       └── progressRoutes.js
│
├── frontend/
│   ├── lib/
│   │   ├── main.dart
│   │   ├── app.dart
│   │   ├── data/
│   │   ├── presentation/
│   │   └── widgets/
│   └── assets/
│       ├── images/
│       └── gifs/
```
---
## 🔐 Environment Variables
```bash
PORT=3000
MONGO_URI=your_mongodb_url
JWT_SECRET=your_secret_key
```
---

## 🧪 API Endpoints
Authentication
```bash
POST /api/auth/signup

POST /api/auth/login
```
Profile
```bash
GET /api/profile

PUT /api/profile
```
Progress
```bash
POST /api/progress

GET /api/progress/report
```
---
## 🖼️ Screenshots
<img width="464" height="852" alt="Screenshot 2025-12-27 004436" src="https://github.com/user-attachments/assets/8c4d8719-2ecc-4a40-9d09-d0ee8632c999" />

## 👤 Author

Meet Nakum\
Flutter & Node.js Developer
