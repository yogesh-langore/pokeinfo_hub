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

<table>
  <tr>
    <th>Home</th>
    <th>Detail</th>
    <th>Favorite</th>
  </tr>
  <tr>
    <td><img src="screenshots/HomeScreen.jpg" width="250"></td>
    <td><img src="screenshots/DetailScreen.jpg" width="250"></td>
    <td><img src="screenshots/FavoriteScreen.jpg" width="250"></td>
  </tr>
  <tr>
    <th>Filter</th>
    <th>Search</th>
    <th>DarkMode</th>
  </tr>
  <tr>
    <td><img src="screenshots/FilterScreen.jpg" width="250"></td>
    <td><img src="screenshots/SearchScreen.jpg" width="250"></td>
    <td><img src="screenshots/DarkModeScreen.jpg" width="250"></td>
  </tr>
</table>
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
