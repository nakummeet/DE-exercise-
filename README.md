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
<table align="center">
  <tr>
    <td><img src="https://github.com/user-attachments/assets/648c5a89-2abf-4a64-a0f8-eb375c445ebe" width="150" alt="Home Screen"/></td>
    <td><img src="https://github.com/user-attachments/assets/0f851b64-e4a4-498e-bae8-fd63b3b6375e" width="150" alt="Product List"/></td>
    <td><img src="https://github.com/user-attachments/assets/bc969072-225f-43ad-98d2-49e790905aba" width="150" alt="Product Details"/></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/253e7ab0-4d6e-4116-a993-b06b69086d7e" width="150" alt="Cart"/></td>
    <td><img src="https://github.com/user-attachments/assets/ae228c56-0d21-427e-9fb3-431f8d2712b1" width="150" alt="Checkout"/></td>
    <td><img src="https://github.com/user-attachments/assets/1e59c977-5bd1-495f-930d-b164ca59220d" width="150" alt="Profile"/></td>
  </tr>
</table>

## 👤 Author

Meet Nakum\
Flutter & Node.js Developer
