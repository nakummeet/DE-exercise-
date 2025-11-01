🏋️‍♂️ Exercise Challenge App

A Flutter-based fitness tracking app designed to help users stay consistent with their workout goals through 30, 60, and 90-day challenge programs.
The app lets users track daily progress, view performance reports, and manage their basic information — all in a simple, motivating interface.

🚀 Features

📅 Challenge Modes — 30-day, 60-day, and 90-day fitness challenges.

✅ Daily Progress Tracking — Mark days as complete and stay accountable.

📊 Report Section — Visual overview of your progress and achievements.

👤 Basic Info Management — Add or edit personal details and preferences.

🧭 Bottom Navigation Bar — Quick access to Home, Report, and Basic Info screens.

💾 Local Data Storage — Saves progress locally for offline use.

💡 Minimal UI — Clean and responsive design for all screen sizes.

🧰 Tech Stack
Layer	Technology
Frontend	Flutter (Dart)
State Management	Provider / setState (depending on your choice)
Storage	SharedPreferences / Hive (if used)
UI Design	Material Design
Version Control	Git + GitHub
📱 Screens Overview

Home Page: Displays challenge overview and navigation options.

Day Pages (Day30 / Day60 / Day90): Track and mark completed days.

Report Page: Summarized view of completed days and streaks.

Basic Info Page: Manage user profile and challenge preferences.

🖼️ App Preview

<div align="center"> <table> <tr> <td align="center"> <img src="https://github.com/user-attachments/assets/9df77f0b-b46c-4301-8dab-01502eac7253" width="200" height="400" alt="Home Screen"/> <br><b>Home</b> </td> <td align="center"> <img src="https://github.com/user-attachments/assets/19614890-9aac-4df4-8a5e-8c25140d5fd6" width="200" height="400" alt="Report Screen"/> <br><b>Report</b> </td> </tr> <tr> <td align="center"> <img src="https://github.com/user-attachments/assets/73f0a226-9b19-4633-ba8d-e322c5022abc" width="200" height="400" alt="Profile Screen"/> <br><b>Profile</b> </td> <td align="center"> <img src="https://github.com/user-attachments/assets/22b83e86-f9d0-43ea-b48b-9fd5664f5ee6" width="200" height="400" alt="Exercise Screen"/> <br><b>Exercise</b> </td> </tr> </table> </div>

⚙️ Installation & Setup

Clone this repository

git clone https://github.com/<your-username>/exercise-challenge-app.git
cd exercise-challenge-app


Install dependencies

flutter pub get


Run the app

flutter run

📂 Project Structure
lib/
├── main.dart                    # Entry point of the app
│
├── challenges/                  # Contains different challenge modules
│   ├── challenge30.dart         # 30-day workout challenge logic & UI
│   ├── challenge60.dart         # 60-day workout challenge logic & UI
│   ├── challenge90.dart         # 90-day workout challenge logic & UI
│   └── workout_detail_page.dart # Detailed view for individual workouts
│
├── screens/                     # App screens (main UI sections)
│   ├── challenge_selection.dart # Page to select between 30, 60, or 90-day challenge
│   ├── home_page.dart           # Home screen with navigation & challenge overview
│   ├── main_scaffold.dart       # Scaffold containing bottom navigation bar
│   ├── profile_page.dart        # Basic info / user profile screen
│   └── report_page.dart         # Progress tracking and performance reports
│
├── utils/                       # Helper and configuration files
│   └── prefs.dart               # SharedPreferences handler for saving user data
│
├── widgets/                     # Reusable UI components
│   ├── challenge_button.dart    # Custom button widget for challenge actions
│   └── exercise_tile.dart       # Tile widget displaying exercise info
│
└── test/                        # Unit and widget tests

🧑‍💻 Developer

Meet Nakum
Full-stack developer focused on building clean, efficient, and user-friendly apps.
📧 nakummeet3570@gmail.com
🌐 GitHub Profile https://github.com/nakummeet
