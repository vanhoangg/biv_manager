# Root `lib/` Ownership

This folder is the app composition layer for the monorepo.

Keep in `lib/`:
- app bootstrap (`main.dart`)
- route composition / app navigation wiring
- app localization files (`l10n`)
- app-specific pages/screens that are not intended to be reused yet
- app-level DI composition (`lib/core/di`)

Move to `modules/` when reusable or feature-owned:
- feature data/domain/presentation stacks (for example `settings`)
- shared widgets/utilities used by multiple features
- feature-specific blocs/repositories/use cases

Notes:
- `modules/` is the source of truth for modular features (`auth`, `customer`, `transaction`, etc.).
- Avoid duplicating widgets/config in both `lib/` and `modules/`.
