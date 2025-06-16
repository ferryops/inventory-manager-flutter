# 📦 Inventory Manager App

A simple and lightweight inventory management app built with **Flutter**. It allows users to easily add, edit, and delete inventory items with persistent local storage. Includes support for dark/light themes and intuitive swipe gestures.

---

## 🚀 Features

- 🧾 Add/Edit/Delete inventory items
- 🌙 Toggle between Dark & Light mode (Shared Preferences)
- 📦 Persistent local storage using SQLite (sqflite)
- 👆 Tap to edit an item
- 👈👉 Swipe to delete an item
- 🔄 Pull-to-refresh item list
- 📱 Responsive UI with Material Design

---

## 📁 Project Structure

```plaintext
lib/
├── main.dart
├── theme_provider.dart
├── database/
│   └── db_helper.dart
├── screens/
│   ├── home_screen.dart
│   └── add_item_screen.dart
````

---

## 🧰 Dependencies

| Package              | Purpose                             |
| -------------------- | ----------------------------------- |
| `provider`           | State management for theme toggling |
| `shared_preferences` | Save user theme preference          |
| `sqflite`            | Local database for inventory        |
| `path_provider`      | Support path for SQLite DB          |

Install them via:

```bash
flutter pub get
```

---

## 🛠️ Getting Started

### 1. Clone the Repo

```bash
git clone https://github.com/ferryops/inventory-manager-flutter.git
cd inventory_manager
```

### 2. Run the App

```bash
flutter pub get
flutter run
```

> Make sure you have Flutter installed and an emulator or device connected.

---

## 📸 Screenshots

> *(Optional - add images here)*

---

## 📖 Documentation

* 📚 [User Manual](https://docs.google.com/document/d/1CLMVGT4D6GoNunF3chfLFOwDNijHsw40xKDZjDKTZ1c/edit?usp=sharing)
* 📝 [Development Report]("https://docs.google.com/document/d/1k5euIuBZGEDs4sR33_xNIG5jrHtrw68rx2vCWw-Trcs/edit?usp=sharing)

---

## 🤝 Contribution

Pull requests are welcome! If you'd like to improve this app (e.g. export, search, sync), feel free to fork and PR.

