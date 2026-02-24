# Biv Manager - Modular Architecture

This project uses a modular architecture with Melos for better separation of concerns, maintainability, and reusability.

## Project Structure

```
packages/
├── core/           # Shared utilities, Result pattern, base classes
├── auth/           # Authentication module
├── customer/       # Customer management module
├── transaction/    # Transaction management module
├── shared/         # Shared UI components
└── app/            # Main application
```

## Getting Started

### Prerequisites

- Flutter SDK >= 3.2.3
- Dart SDK >= 3.2.3
- Melos

### Installation

1. Install Melos globally:
```bash
dart pub global activate melos
```

2. Bootstrap the workspace:
```bash
melos bootstrap
```

3. Get dependencies for all packages:
```bash
melos pub-get
```

## Package Descriptions

### Core Package (`packages/core/`)
- **Purpose**: Shared utilities and base classes
- **Contains**: Result pattern, base use cases, failure classes, dependency injection
- **Dependencies**: equatable, get_it
- **Used by**: All other packages

### Auth Package (`packages/auth/`)
- **Purpose**: Authentication functionality
- **Contains**: Login, registration, password reset, user management
- **Dependencies**: core, firebase_auth, flutter_bloc
- **Used by**: app package

### Customer Package (`packages/customer/`)
- **Purpose**: Customer management functionality
- **Contains**: Customer CRUD operations, customer search, filtering
- **Dependencies**: core, cloud_firestore, flutter_bloc
- **Used by**: transaction package, app package

### Transaction Package (`packages/transaction/`)
- **Purpose**: Transaction management functionality
- **Contains**: Transaction CRUD operations, reporting, analytics
- **Dependencies**: core, customer, cloud_firestore, flutter_bloc
- **Used by**: app package

### Shared Package (`packages/shared/`)
- **Purpose**: Shared UI components and utilities
- **Contains**: Common widgets, theme, routing, localization
- **Dependencies**: core, flutter, go_router
- **Used by**: app package

### App Package (`packages/app/`)
- **Purpose**: Main application
- **Contains**: App entry point, navigation, main UI
- **Dependencies**: All other packages
- **Used by**: End users

## Development Workflow

### Running the App

```bash
# Run the main app
cd packages/app
flutter run

# Or use Melos
melos run --scope=app flutter run
```

### Development Commands

```bash
# Analyze all packages
melos analyze

# Run tests for all packages
melos test

# Build all packages
melos build

# Clean all packages
melos clean

# Format all packages
melos format

# Lint all packages
melos lint
```

### Working on a Specific Package

```bash
# Work on auth package
cd packages/auth
flutter pub get
flutter test
flutter analyze

# Or use Melos with scope
melos run --scope=auth flutter test
```

## Adding New Features

### 1. Determine the Right Package
- **Core utilities** → `packages/core/`
- **Authentication** → `packages/auth/`
- **Customer management** → `packages/customer/`
- **Transaction management** → `packages/transaction/`
- **Shared UI** → `packages/shared/`
- **App-specific** → `packages/app/`

### 2. Follow Clean Architecture
Each package should follow Clean Architecture:
```
lib/
├── domain/          # Business logic
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── data/            # Data layer
│   ├── models/
│   ├── repositories/
│   └── datasources/
└── presentation/    # UI layer
    ├── blocs/
    └── pages/
```

### 3. Update Dependencies
- Add dependencies to the package's `pubspec.yaml`
- Update the main app's `pubspec.yaml` if needed

## Testing

### Unit Tests
Each package has its own test directory:
```
packages/auth/test/
packages/customer/test/
packages/transaction/test/
```

### Integration Tests
Integration tests are in the app package:
```
packages/app/integration_test/
```

### Running Tests
```bash
# Test all packages
melos test

# Test specific package
melos run --scope=auth flutter test

# Test with coverage
melos run --scope=auth flutter test --coverage
```

## Building

### Development Build
```bash
cd packages/app
flutter build apk --debug
```

### Production Build
```bash
cd packages/app
flutter build apk --release
```

### Web Build
```bash
cd packages/app
flutter build web
```

## Deployment

### Android
```bash
cd packages/app
flutter build appbundle --release
```

### iOS
```bash
cd packages/app
flutter build ios --release
```

### Web
```bash
cd packages/app
flutter build web --release
```

## Troubleshooting

### Common Issues

1. **Dependency Issues**
   ```bash
   melos clean
   melos bootstrap
   melos pub-get
   ```

2. **Build Issues**
   ```bash
   melos clean
   melos pub-get
   melos build
   ```

3. **Import Issues**
   - Ensure you're using package imports: `import 'package:core/result.dart';`
   - Check that dependencies are correctly declared in `pubspec.yaml`

4. **Circular Dependencies**
   - Ensure dependencies flow in one direction: core → auth/customer/transaction → app
   - Use shared package for common dependencies

### Getting Help

1. Check the migration guide: `MIGRATION_GUIDE.md`
2. Review package dependencies in `pubspec.yaml` files
3. Ensure all imports use package names
4. Run `melos analyze` to check for issues

## Contributing

1. Create a feature branch
2. Make changes in the appropriate package
3. Add tests for new functionality
4. Run `melos analyze` and `melos test`
5. Submit a pull request

## Architecture Benefits

- **Separation of Concerns**: Each module has a single responsibility
- **Reusability**: Modules can be reused in other projects
- **Testability**: Easier to test individual modules
- **Maintainability**: Changes in one module don't affect others
- **Team Collaboration**: Different teams can work on different modules
- **Build Performance**: Only rebuild changed modules 