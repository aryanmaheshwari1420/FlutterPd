# Rick & Morty Characters Explorer

A production-ready Flutter application that displays characters from the [Rick and Morty API](https://rickandmortyapi.com/).

## Features
- **Clean Architecture**: Modular and maintainable code structure.
- **Offline Support**: Local caching using Isar Database.
- **Pagination**: Smooth infinite scrolling for character data.
- **State Management**: Robust state handling with Riverpod.
- **Modern UI**: Hero animations, Cached Network Images, and Material 3 design.

## Setup Instructions

### Prerequisites
- Flutter SDK (latest stable)
- Android Studio / VS Code with Flutter extension

### Installation
1. Clone the repository (or extract the source).
2. Navigate to the project root:
   ```bash
   cd Flutterpd
   ```
3. Fetch dependencies:
   ```bash
   flutter pub get
   ```
4. Run code generation (Freezed, Isar, Riverpod):
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
5. Run the application:
   ```bash
   flutter run
   ```

## Architecture Overview
The project follows **Clean Architecture** principles to separate concerns:

- **Domain Layer**: Contains business logic, Entities (`Character`), and Repository interfaces.
- **Data Layer**: Handles data fetching and persistence. includes `ApiService` (Dio), `LocalStorageService` (Isar), and `CharacterRepositoryImpl`.
- **Presentation Layer**: UI logic and widgets. Uses Riverpod for state management and reactive updates.

## Key Decisions & Trade-offs
- **State Management**: Chosen **Riverpod** over Bloc for its simplicity and powerful dependency injection features.
- **Storage**: Used **Isar** instead of Room or SQLite for its speed and type-safe nature in Flutter.
- **Caching Strategy**: The app uses a "Cache-First, Fetch-Second" approach. It attempts to fetch from the API, updates the cache, and falls back to the cache if the network fails.

## Known Limitations
- **Search/Filters**: Currently not implemented; characters are fetched in order of ID.
- **Deep Linking**: Not supported in this version.
- **Unit Tests**: Only basic boilerplate tests are included; full coverage is a future enhancement.
