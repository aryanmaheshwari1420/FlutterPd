# Rick & Morty Characters Explorer

A Flutter application that displays characters from the
[Rick and Morty API](https://rickandmortyapi.com/) with offline support
and clean architecture.

## Features

- Clean Architecture (Domain, Data, Presentation)
- Offline caching using Isar Database
- Infinite pagination
- State management with Riverpod
- Material 3 UI with cached images

## Tech Stack

- Flutter & Dart
- Riverpod
- Dio
- Isar
- Freezed, build_runner

## Setup

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```
