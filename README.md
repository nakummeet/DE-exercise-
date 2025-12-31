🏋️ Exercise Challenge App (Flutter + Node.js)

A full-stack fitness challenge mobile application where users can take 30 / 60 / 90 day or custom exercise challenges, complete daily workouts, and track their progress securely.

📱 Features

🔐 User Authentication (Login / Signup)

🏃 30-Day, 60-Day, 90-Day Challenges

🧩 Custom Day Challenge (user-defined)

📆 Day-wise exercise tracking

🎥 Exercise animations using GIFs

✅ Completed days marked with ✔

📊 Progress & fitness report (BMI, streaks)

🔄 Resume challenge after app restart

🚪 Secure logout

🌙 Clean dark UI design

🧠 How the App Works (Simple Explanation)

Flutter (Frontend)
Handles UI, navigation, animations, and user interaction.

Node.js Backend
Manages login, user data, progress tracking, and security.

MongoDB Database
Stores user accounts and completed challenge days.

JWT Authentication
Protects APIs and ensures only logged-in users can access data.

🛠️ Tech Stack
Frontend

Flutter (Dart)

Material UI

Curved Navigation Bar

Backend (separate repo)

Node.js

Express

MongoDB

JWT Authentication

lib/
├── main.dart
├── app.dart
├── core/
│   └── storage/
├── data/
│   ├── models/
│   └── services/
├── presentation/
│   ├── auth/
│   ├── home/
│   ├── exercise/
│   ├── profile/
│   ├── report/
│   └── navigation/
├── widgets/

assets/
├── images/
└── gifs/


⬇️ How to Download & Run the App
1️⃣ Clone the repository
git clone <your-repo-url>
cd deapp

2️⃣ Install Flutter dependencies
flutter pub get

3️⃣ Run the app (Android emulator or device)
flutter run


⚠️ Note:
Flutter Web may face CORS issues due to backend security.
The app is best demonstrated on Android Emulator or physical device.

📦 Dependencies Used (pubspec.yaml)

Below are the main dependencies and why they are used:

dependencies:
  flutter:
    sdk: flutter

  http: ^1.2.0
  # Used for API calls (login, profile, progress)

  shared_preferences: ^2.2.2
  # Used to store JWT token and active challenge locally

  curved_navigation_bar: ^1.0.6
  # Used for bottom navigation bar

  intl: ^0.19.0
  # Used for date formatting (if needed in reports)

  cupertino_icons: ^1.0.6
  # iOS-style icons

🔐 Authentication Flow (Short)

User logs in

Backend returns JWT token

Token is stored locally

Token is sent with every API request

Logout clears the token

🧪 Backend API Used
Feature	Endpoint
Login	POST /api/auth/login
Signup	POST /api/auth/signup
Profile	GET /api/profile
Update Profile	PUT /api/profile
Mark Day Complete	POST /api/progress
Get Report	GET /api/progress/report
🎤 How to Explain This Project (One Line)

“This is a full-stack fitness challenge app where Flutter handles the UI and Node.js manages authentication, progress tracking, and data storage.”

🚀 Future Improvements

Reset challenge option

Push notifications for daily reminders

Cloud sync for multiple devices

Graph-based analytics

👤 Author

Meet Nakum
Student | Flutter & Node.js Developer
