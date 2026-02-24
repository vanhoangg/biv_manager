# Shared Decisions

## Status

- Status: Approved baseline
- Updated: 2026-02-24

## Product / Backend Choices

- Active backend: Firebase (Firestore + Firebase Auth + Firebase Storage)
- Do not implement Rust REST API / Dio / Retrofit in this pass
- Keep codebase migration-friendly for future API endpoints

## Feature Scope Choices

- Attachment support: image/bill images only (first pass)
- Attachment storage: Firebase Storage, save download URL in Firestore transaction docs
- Voice notes: speech-to-text transcript only (no audio file persistence)
- Report export formats: PDF and Excel

## Data / Schema Choices

- Schema strategy: additive, backward-compatible field additions
- Existing Firestore documents must continue to deserialize without migration
- New optional fields default to `null` / empty values

## Analytics Defaults

- `expense` => debt increase
- `income` => payment / recovery
- `remainingDebt = totalDebt - totalPaid`
- Exclude `cancelled` transactions from debt/recovery metrics (unless explicitly needed)

## Architecture Choices

- Repositories should be backend-agnostic at remote boundary
- Add remote ports/interfaces and backend selection config to ease future API migration
- `shared` package must remain decoupled from app-generated localization code and app page imports

