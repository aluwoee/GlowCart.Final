# GlowCart Final Project

GlowCart is a cosmetics e-commerce marketplace app made for the Flutter final project.

## Implemented requirements

- Clean Architecture structure: `core`, `features`, `data`, `domain`, `presentation`
- Declarative navigation with `go_router`
- State management and dependency injection with `Riverpod`
- External API integration with `Chopper`
- JSON serialization into Dart model classes
- Shared Preferences for theme mode
- Drift SQLite database for favorite products and order history
- Responsive GridView product layout
- Loading and error states
- README documentation

## Setup

Run these commands after opening the project folder:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

If your project has no `android`, `ios`, `web`, or `windows` folders, run:

```bash
flutter create .
```

Then run:

```bash
flutter run
```

For web:

```bash
flutter run -d chrome
```

## App pages

- Home page: product grid from API
- Product details page
- Cart page
- Favorites page
- Orders page
- Settings page with theme toggle

## API

The app loads products from:

`https://dummyjson.com/products`
