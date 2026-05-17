# Coffee Shop — Flutter Final Project

A coffee shop mobile and web application built with Flutter. Users can browse the menu, add items to the cart, save favorites, place orders, and view their order history through Firebase.

---

## Team

**Nurzhan Zhumabekov** (Nurzhan.D.Zhumabekov)
1. Project architecture (Clean Architecture)
2. REST API integration with Chopper
3. Navigation setup with go_router
4. Menu screen and product detail screen

**Nurassyl Nygmet** (NurasylAitu)
1. Light and dark theme toggle persisted with SharedPreferences
2. Favorites screen with local storage using Drift (SQLite)
3. Cart screen
4. Menu search with saved search history

**Nurbek Yerbulekov** (Bornqazaq)
1. Firebase Authentication (email and password sign in and registration)
2. Cloud Firestore for saving and displaying order history
3. Orders screen
4. Settings screen with account info and sign out

---

## Features

- Browse hot and iced coffee menu loaded from a public REST API
- Product detail page with description, price, and image
- Add items to cart, change quantities, and place an order
- Save favorite items locally, they persist between sessions
- Search history is saved and shown as chips below the search bar
- Register and sign in with email and password via Firebase
- Order history is stored in the cloud with Firestore
- Switch between light and dark theme, preference is saved

---

## Technologies used

- Flutter 3.41.5 and Dart 3.11.3
- Riverpod for state management
- go_router for navigation with auth redirect guard
- Chopper as the HTTP client for the REST API
- json_serializable for JSON model generation
- Drift with SQLite for local favorites storage
- Shared Preferences for theme and search history
- Firebase Auth for email and password authentication
- Cloud Firestore for cloud order storage

---

## Architecture

The project follows Clean Architecture and is split into three layers:

- domain — entities like Product and AppOrder, and repository interfaces
- data — models, Chopper service, Drift database, repository implementations
- presentation — Riverpod providers, screens, router, and widgets

---

## Getting started

1. Clone the repository and navigate into the folder
2. Run `flutter pub get`
3. Make sure `firebase_options.dart` is present, or run `flutterfire configure`
4. In Firebase Console enable Authentication with Email/Password and create a Firestore Database
5. Run `flutter run -d chrome` for web or `flutter run -d android` for Android

---

## API

Product data is fetched from the public sampleapis.com service:

- Hot coffees: `https://api.sampleapis.com/coffee/hot`
- Iced coffees: `https://api.sampleapis.com/coffee/iced`

---

## Screenshots

Login screen
![Login screen](screenshots/login.png)

Register screen
![Register screen](screenshots/register.png)

Menu — hot drinks
![Menu hot](screenshots/menu_hot.png)

Menu — iced drinks
![Menu iced](screenshots/menu_iced.png)

Product detail
![Product detail](screenshots/product_detail.png)

Cart
![Cart](screenshots/cart.png)

Order history
![Orders](screenshots/orders.png)

Search with history
![Search history](screenshots/search_history.png)

Settings
![Settings](screenshots/settings.png)

---

## Demo video

[Watch the demo video](<INSERT_VIDEO_LINK_HERE>)
