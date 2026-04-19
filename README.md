# 🎓 Campus Club Hub

**Vishwakarma Institute of Technology**
**Subject:** Mobile Application Development
**Student:** Arnav Kale
**GitHub:** 00FY

> A Flutter-based mobile application to centralize and manage college club activities — including events, members, and dashboard insights.

---

## 📱 Features

* 🔐 Login system with role selection
* 📊 Dynamic dashboard with live data
* 📅 Event management (API-based)
* 🏫 Club listing and profiles
* 💾 Persistent login using local storage
* 🎨 Clean UI with Material Design

---

## 📋 Lab Experiments

---

### ✅ Lab 1 — Introduction to Flutter & Dart

**Aim:** Set up Flutter SDK, run first Flutter app, practice Dart basics

**Concepts covered:**

* Flutter project structure
* StatelessWidget, MaterialApp, Scaffold
* Dart variables, lists, loops
* Dart classes (ClubModel)

**Files:**

* `lib/main.dart`
* `lib/app/app.dart`
* `lib/models/club_model.dart`

---

### ✅ Lab 2 — Flutter Project Structure & Widgets

**Aim:** Build login UI using Flutter widgets

**Concepts covered:**

* Widgets: Text, Column, Container, TextField
* ThemeData (light/dark mode)
* InputDecoration & styling

**Files:**

* `lib/theme/app_colors.dart`
* `lib/theme/app_theme.dart`
* `lib/views/auth/login_screen.dart`

---

### ✅ Lab 3 — Layouts and Styling

**Aim:** Design responsive UI layouts

**Concepts covered:**

* Row, Column, Expanded
* SizedBox, Padding, Margin
* UI alignment and spacing

**Files:**

* Updated login screen UI

---

### ✅ Lab 4 — User Input & Forms

**Aim:** Handle user input and validation

**Concepts covered:**

* TextEditingController
* Form & TextFormField
* Basic validation

**Files:**

* `login_screen.dart` updated

---

### ✅ Lab 5 — Navigation and Routing

**Aim:** Navigate between multiple screens

**Concepts covered:**

* GetX navigation
* Named routes
* Passing data between screens

**Files:**

* `lib/utils/constants.dart`
* Updated `app.dart` with routes

---

### ✅ Lab 6 — State Management

**Aim:** Manage UI updates dynamically

**Concepts covered:**

* setState
* StatefulWidget
* Handling UI changes

**Files:**

* Dashboard & login updates

---

### ✅ Lab 7 — Lists and Dynamic Content

**Aim:** Display lists dynamically

**Concepts covered:**

* ListView.builder
* Card widgets
* Dynamic event list

**Files:**

* `event_list_screen.dart`

---

### ✅ Lab 8 — Fetching Data from APIs

**Aim:** Fetch and display data from REST API

**Concepts covered:**

* HTTP package
* JSON parsing
* FutureBuilder
* Async programming

**Files:**

* `lib/services/api_services.dart`
* Updated `event_list_screen.dart`

---

### ✅ Lab 9 — Local Data Storage

**Aim:** Store login data locally

**Concepts covered:**

* SharedPreferences
* Persistent login
* Saving user role

**Files:**

* `lib/services/storage_service.dart`
* Updated login logic

---

### ✅ Lab 10 — Final App Build & Deployment

**Aim:** Finalize app and generate APK

**Concepts covered:**

* UI polishing
* Dynamic dashboard
* APK generation
* Debugging

**Output:**

* `app-release.apk`

---

## 🧪 How to Run

```bash
flutter pub get
flutter run
```

---

## 📦 Build APK

```bash
flutter build apk --release
```

---

## 📂 APK Location

```bash
build/app/outputs/flutter-apk/app-release.apk
```

---

## 🧠 Learning Outcome

* Understanding Flutter architecture
* Building complete mobile applications
* API integration and data handling
* State management and navigation
* Deploying real-world apps

---

## 📌 Conclusion

This project demonstrates the development of a fully functional Flutter application integrating UI design, API handling, local storage, and deployment. It reflects practical implementation of all core mobile application development concepts.

---
