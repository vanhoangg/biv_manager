# Biv Manager

A debt management application built with Flutter.

## Environment Setup

### Prerequisites
- Flutter SDK (3.19.0 or higher)
- Dart SDK (3.0.0 or higher)
- Chrome (for web development)

### Environment Variables

Create a `.env` file in the project root with the following variables:

```bash
# Firebase Configuration
FIREBASE_API_KEY=your_firebase_api_key
FIREBASE_APP_ID=your_firebase_app_id
FIREBASE_PROJECT_ID=your_firebase_project_id
FIREBASE_MESSAGING_SENDER_ID=your_firebase_messaging_sender_id
FIREBASE_AUTH_DOMAIN=your_firebase_auth_domain
FIREBASE_STORAGE_BUCKET=your_firebase_storage_bucket

# API Configuration
API_KEY=your_api_key
BASE_URL=your_base_url

# Backdoor Access (Development Only)
BACKDOOR_EMAIL=dev@example.com
BACKDOOR_PASSWORD=dev_password

# Environment
FLAVOR=dev # Options: dev, staging, prod
```

### Running the App

1. **Development Environment**
   ```bash
   ./scripts/run.sh
   ```

2. **Staging Environment**
   ```bash
   FLAVOR=staging ./scripts/run.sh
   ```

3. **Production Environment**
   ```bash
   FLAVOR=prod ./scripts/run.sh
   ```

### CI/CD Setup

The project uses GitHub Actions for CI/CD. Set up the following secrets in your GitHub repository:

#### Development Secrets
- `DEV_FIREBASE_API_KEY`
- `DEV_FIREBASE_APP_ID`
- `DEV_FIREBASE_PROJECT_ID`
- `DEV_FIREBASE_MESSAGING_SENDER_ID`
- `DEV_FIREBASE_AUTH_DOMAIN`
- `DEV_FIREBASE_STORAGE_BUCKET`
- `DEV_API_KEY`
- `DEV_BASE_URL`
- `DEV_BACKDOOR_EMAIL`
- `DEV_BACKDOOR_PASSWORD`

#### Production Secrets
- `FIREBASE_API_KEY`
- `FIREBASE_APP_ID`
- `FIREBASE_PROJECT_ID`
- `FIREBASE_MESSAGING_SENDER_ID`
- `FIREBASE_AUTH_DOMAIN`
- `FIREBASE_STORAGE_BUCKET`
- `API_KEY`
- `BASE_URL`
- `BACKDOOR_EMAIL`
- `BACKDOOR_PASSWORD`

## Project Structure

```
lib/
├── core/
│   ├── config/         # Environment and app configuration
│   ├── constants/      # App-wide constants
│   ├── di/            # Dependency injection
│   ├── l10n/          # Localization
│   ├── router/        # Navigation
│   ├── services/      # Core services
│   ├── theme/         # Theme configuration
│   └── utils/         # Utility functions
├── data/
│   └── repositories/  # Repository implementations
├── domain/
│   ├── entities/      # Business objects
│   ├── repositories/  # Repository interfaces
│   └── usecases/      # Business logic
├── features/          # Feature modules
└── presentation/
    ├── blocs/         # State management
    ├── pages/         # UI pages
    └── widgets/       # Reusable widgets
```

## Development

### Code Style
- Follow the [Dart style guide](https://dart.dev/guides/language/effective-dart/style)
- Run `flutter analyze` before committing
- Run `dart format .` to format code

### Testing
- Write unit tests for business logic
- Write widget tests for UI components
- Run tests with `flutter test`

### Building
- Web: `flutter build web`
- Android: `flutter build apk`
- iOS: `flutter build ios`

## Contributing

1. Create a feature branch
2. Make your changes
3. Run tests and ensure they pass
4. Submit a pull request

## License

This project is proprietary and confidential.
