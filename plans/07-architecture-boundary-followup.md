# Architecture Boundary Review Follow-up (Handoff)

Purpose: capture what is done, what remains, and the next steps for tomorrow's review/refactor session.

## Completed (This Session)

### Monorepo structure / tooling
- Renamed workspace folder from `packages/` to `modules/`
- Updated Melos/root path dependencies and re-bootstrapped workspace
- Added root analyzer exclude for `modules/**` so root `flutter analyze` does not report false nested-package import errors

### Splash/startup unblock + routing wiring
- Root app (`/lib/main.dart`) now uses `MaterialApp.router`
- Added startup routing so app no longer gets stuck on splash
- Auth pages (`register`, `forgot password`) are wrapped with `AuthBloc` provider
- Fixed runtime login localization crash (`dontHaveAccount` missing)

### Duplicate cleanup (root vs modules)
- Removed stale root transaction placeholder files:
  - `lib/data/datasources/transaction/transaction_local_data_source.dart`
  - `lib/domain/usecases/transaction/get_transactions_usecase.dart`
- Removed duplicate root widgets that already exist in `modules/shared`:
  - `lib/presentation/widgets/custom_app_bar.dart`
  - `lib/presentation/widgets/error_view.dart`
  - `lib/presentation/widgets/loading_indicator.dart`
- Removed duplicate root env config:
  - `lib/core/config/env_config.dart`
- Cleaned stale exports from `lib/index.dart`

### Root ownership clarification
- Added `lib/README.md` to define what belongs in root `lib/` vs `modules/`

### Settings feature migration
- Moved full `settings` feature stack from root `lib/` into `modules/settings`
- Added `modules/settings/lib/di/settings_module.dart`
- Root DI now composes settings via `registerSettingsModule(sl)`
- Root navigation imports `SettingsPage` from `package:settings`

### DI modularization progress
- Added module registration helpers:
  - `registerAuthModule(sl)`
  - `registerSettingsModule(sl)`
  - `registerCustomerModule(sl)`
  - `registerTransactionModule(sl)`
- Root DI (`lib/core/di/injection_container.dart`) now composes modules rather than wiring those module internals directly

### Shared vs app-layer separation progress
- Moved app-specific auth routing policy out of `modules/shared`
- Added app-layer guard:
  - `lib/core/navigation/app_navigation_guard.dart`
- Root app now uses `AppNavigationGuard`
- `modules/shared` no longer exports `navigation_guard`

### Theme ownership progress
- Added app-specific brand theme builders:
  - `modules/app/lib/theme/biv_theme_builder.dart`
- `ThemeManager` in `modules/shared` now supports app-layer theme builder registration
- Root and app scaffold entrypoints register app theme builders at startup

## Current Status (Summary)

- Boundary clarity: improved significantly
- Root DI: now mostly a composition root for feature modules
- `settings`: modularized successfully
- Shared/app separation: improved, but not finished
- Tooling/analyzers: clean (`flutter analyze` root + `melos run analyze`)

## Remaining Issues / Technical Debt

### 1) `AppConstants` still mixes shared and app-specific concerns
File:
- `modules/shared/lib/constants/app_constants.dart`

Problem:
- Contains app name, routes, API endpoints, asset paths, storage keys, UI text-related constants
- Many of these are app/product-specific, not truly reusable shared concerns

Impact:
- Makes `modules/shared` harder to reuse/customize for another app

### 2) Legacy unused shared navigation guard file still exists
File:
- `modules/shared/lib/services/navigation_guard.dart`

Status:
- No longer exported / no longer used by root app

Risk:
- Future contributors may use it accidentally and reintroduce app policy into `shared`

### 3) `BivManagerApp` still depends on global `GetIt`
File:
- `modules/app/lib/biv_manager_app.dart`

Problem:
- Pulls `ThemeManager` and `LocalizationService` directly from `GetIt`

Impact:
- App shell is only semi-reusable and harder to test in isolation

### 4) `ThemeManager` still contains default concrete theme implementation in `shared`
File:
- `modules/shared/lib/theme/theme_manager.dart`

Status:
- App brand themes are now overrideable via registered builders
- But `shared` still ships the full default Biv-like theme implementation as fallback

Impact:
- Shared module still carries more visual/product opinion than necessary

### 5) `modules/shared/router/app_router.dart` still depends on app route constants by default
File:
- `modules/shared/lib/router/app_router.dart`

Status:
- No baked-in redirect anymore (good)
- Still defaults `initialLocation` to `AppConstants.routes.splash`

Impact:
- Router helper is still coupled to this app's route conventions

### 6) Root app still imports broad `package:shared/index.dart`
Files (examples):
- `lib/main.dart`
- `lib/core/di/injection_container.dart`

Problem:
- Broad barrel imports hide coupling and make boundary cleanup harder

Impact:
- Easier to accidentally reintroduce shared/app mixing

## Recommended Next Steps (Tomorrow)

### Step 1 (small cleanup, low risk)
- Delete legacy file: `modules/shared/lib/services/navigation_guard.dart`
- Run:
  - `flutter analyze`
  - `dart run melos run analyze`

### Step 2 (high value boundary cleanup)
- Split `modules/shared/lib/constants/app_constants.dart` into:
  - `shared` constants only (storage keys, maybe generic error codes)
  - app-layer constants (routes, app name, API endpoints, asset paths)
- Suggested destination for app-specific constants:
  - `lib/core/constants/` or `modules/app/lib/constants/`

### Step 3 (decouple app shell from service locator)
- Refactor `modules/app/lib/biv_manager_app.dart` to accept dependencies via constructor:
  - `ThemeManager`
  - `LocalizationService`
- Root `lib/main.dart` resolves from `GetIt` and passes them in
- Keep convenience constructor only if needed

### Step 4 (trim shared theme fallback)
- In `modules/shared/lib/theme/theme_manager.dart`, reduce fallback theme complexity
- Keep persistence/state logic in shared
- Keep real brand theme definitions in `modules/app/lib/theme/biv_theme_builder.dart`

### Step 5 (reduce shared router coupling)
- Make `modules/shared/lib/router/app_router.dart` require `initialLocation` (or remove app-specific default)
- Avoid depending on `AppConstants.routes.splash` in shared

### Step 6 (import hygiene pass)
- Replace broad `package:shared/index.dart` imports in root app composition files with targeted imports
- Prioritize:
  - `lib/main.dart`
  - `lib/core/di/injection_container.dart`

## Suggested Review Checklist (Tomorrow)

- [ ] App launches and leaves splash correctly
- [ ] Login/register/forgot password flows still navigate
- [ ] Settings page still loads and logout still works
- [ ] `flutter analyze` (root) passes
- [ ] `dart run melos run analyze` passes
- [ ] No app-specific auth policy remains in `modules/shared`
- [ ] `shared` exports only reusable APIs

## Useful Commands

```bash
dart run melos bootstrap
flutter analyze
dart run melos run analyze
./scripts/run.sh
```
