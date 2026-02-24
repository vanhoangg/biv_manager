# Migration Guide: Monolithic to Modular Architecture with Melos

## Overview

This guide explains how to migrate your current monolithic Flutter app to a modular architecture using Melos.

## Current Structure (Monolithic)

```
lib/
├── core/
├── data/
├── domain/
├── presentation/
└── shared/
```

## Target Structure (Modular)

```
packages/
├── core/           # Shared utilities, Result pattern, base classes
├── auth/           # Authentication module
├── customer/       # Customer management module
├── transaction/    # Transaction management module
├── shared/         # Shared UI components
└── app/            # Main application
```

## Step-by-Step Migration

### 1. Install Melos

```bash
dart pub global activate melos
```

### 2. Initialize Melos Workspace

```bash
melos bootstrap
```

### 3. Move Core Components

**From:** `lib/core/`
**To:** `packages/core/lib/`

- `result.dart` → `packages/core/lib/result.dart`
- `usecases/usecase.dart` → `packages/core/lib/usecases/usecase.dart`
- `error/failures.dart` → `packages/core/lib/error/failures.dart`
- `di/injection_container.dart` → `packages/core/lib/di/injection_container.dart`

### 4. Move Auth Module

**From:** `lib/domain/usecases/auth/`, `lib/presentation/blocs/auth/`, `lib/presentation/pages/auth/`
**To:** `packages/auth/lib/`

```
packages/auth/lib/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── data/
│   ├── models/
│   ├── repositories/
│   └── datasources/
└── presentation/
    ├── blocs/
    └── pages/
```

### 5. Move Customer Module

**From:** `lib/domain/usecases/customer/`, `lib/presentation/blocs/customer/`, `lib/presentation/pages/customers/`
**To:** `packages/customer/lib/`

### 6. Move Transaction Module

**From:** `lib/domain/usecases/transaction/`, `lib/presentation/blocs/transaction/`, `lib/presentation/pages/transactions/`
**To:** `packages/transaction/lib/`

### 7. Move Shared Components

**From:** `lib/shared/`
**To:** `packages/shared/lib/`

### 8. Update Import Statements

Replace relative imports with package imports:

```dart
// Before
import '../../../core/result.dart';

// After
import 'package:core/result.dart';
```

### 9. Update Main App

**From:** `lib/main.dart`
**To:** `packages/app/lib/main.dart`

## Package Dependencies

### Core Package
- Base classes, Result pattern, utilities
- No external dependencies except equatable

### Auth Package
- Depends on: core, firebase_auth, flutter_bloc

### Customer Package
- Depends on: core, cloud_firestore, flutter_bloc

### Transaction Package
- Depends on: core, customer, cloud_firestore, flutter_bloc

### Shared Package
- Depends on: core, flutter, go_router

### App Package
- Depends on: all other packages

## Benefits of Modular Architecture

1. **Separation of Concerns**: Each module has a single responsibility
2. **Reusability**: Modules can be reused in other projects
3. **Testability**: Easier to test individual modules
4. **Maintainability**: Changes in one module don't affect others
5. **Team Collaboration**: Different teams can work on different modules
6. **Build Performance**: Only rebuild changed modules

## Melos Commands

```bash
# Analyze all packages
melos analyze

# Run tests for all packages
melos test

# Build all packages
melos build

# Clean all packages
melos clean

# Get dependencies for all packages
melos pub-get

# Format all packages
melos format

# Lint all packages
melos lint
```

## Migration Checklist

- [ ] Install Melos
- [ ] Create melos.yaml
- [ ] Create package structure
- [ ] Move core components
- [ ] Move auth module
- [ ] Move customer module
- [ ] Move transaction module
- [ ] Move shared components
- [ ] Update import statements
- [ ] Update main app
- [ ] Test all modules
- [ ] Update CI/CD pipeline

## Common Issues and Solutions

### 1. Circular Dependencies
- Ensure dependencies flow in one direction: core → auth/customer/transaction → app

### 2. Import Errors
- Use absolute imports with package names
- Update pubspec.yaml dependencies

### 3. Build Issues
- Run `melos bootstrap` to set up workspace
- Run `melos pub-get` to get all dependencies

### 4. Test Failures
- Update test imports to use package names
- Ensure test files are in the correct package

## Next Steps

1. Start with the core package
2. Move one module at a time
3. Test thoroughly after each migration
4. Update documentation
5. Train team on new structure 