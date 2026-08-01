# 📱 PokeInfo Hub

A modern Pokédex application built with **Flutter** that allows users to browse Pokémon, search by name, filter by type, view detailed information, and save favorites for offline access.

Built using **Flutter**, **Riverpod**, **Hive**, and **REST API** following clean and maintainable development practices.

---

## ✨ Features

- Browse all Pokémon in a responsive grid layout
- Search Pokémon by name
- Filter Pokémon by type (Fire, Water, Grass, Electric, etc.)
- Detailed Pokémon information
- Animated Hero image transition
- Rotating Pokéball background animation
- Save favorite Pokémon locally using Hive
- Remove Pokémon from favorites
- Light & Dark theme support
- Cached network images
- Responsive UI

---

## 📸 Screenshots

| Home | Search |
|------|---------|
| ![](screenshots/home.png) | ![](screenshots/search.png) |

| Filter | Details |
|------|---------|
| ![](screenshots/filter.png) | ![](screenshots/detail.png) |

| Favorites | Dark Mode |
|------|---------|
| ![](screenshots/favorites.png) | ![](screenshots/dark_mode.png) |

---

## 🛠 Tech Stack

- Flutter
- Dart
- Riverpod
- Hive
- REST API
- Cached Network Image

---

## 📦 Packages Used

```yaml
flutter_riverpod
dio
hive
hive_flutter
hive_generator
build_runner
cached_network_image
google_fonts
json_annotation
json_serializable
```

---

## 🏗 Architecture

```
lib
│
├── model
├── providers
├── repo
├── theme
├── ui
│   ├── screens
│   └── widgets
└── utils
```

The application follows a clean structure using:

- Riverpod for state management
- Repository pattern for data handling
- Hive for local persistence
- REST API for fetching Pokémon data

---

## 🚀 Getting Started

### Clone the repository

```bash
git clone https://github.com/yogesh-langore/pokeinfo_hub.git
```

Move into the project

```bash
cd pokeinfo_hub
```

Install dependencies

```bash
flutter pub get
```

Generate model files

```bash
dart run build_runner build --delete-conflicting-outputs
```

Run the application

```bash
flutter run
```

---

## 📂 Project Structure

```
assets/
images/
lib/
screenshots/
android/
ios/
linux/
macos/
web/
windows/
```

---

## 🎯 Future Improvements

- Pokémon Evolution Chain
- Pokémon Statistics Charts
- Ability Details
- Multiple Type Filtering
- Offline API Caching
- Sorting Options
- Pagination
- Better Animations

---

## 👨‍💻 Author

**Yogesh Langore**

GitHub:
https://github.com/yogesh-langore

LinkedIn:
https://www.linkedin.com/in/yogesh-langore

---

## ⭐ Support

If you found this project useful, consider giving it a ⭐ on GitHub.
