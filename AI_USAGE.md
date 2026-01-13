# AI Usage Report

## AI Tools Used
- **Antigravity (Gemini)** – used for code generation, architecture setup, and debugging.

## Where AI Was Used
AI was used across the application:
- **Domain Layer**: Entities and repository interfaces
- **Data Layer**: DTOs, Isar models, API and local storage implementation
- **Presentation Layer**: Riverpod providers and Flutter UI screens
- **Build Setup**: `pubspec.yaml` dependencies and `build_runner`

## What Was Accepted vs Modified
- **Accepted**: Clean Architecture structure and basic boilerplate
- **Modified**:
  - Repository logic for smooth online/offline pagination
  - Provider logic to handle "load more" without clearing existing data

## What Was Rejected
- Rejected **Hive** in favor of **Isar** for better performance
- Rejected a **global provider** approach to maintain separation of concerns

## Human Improvements
Improved pagination error handling so existing data remains visible when "load more" fails, preserving the user's scroll position instead of showing a full error screen.
