# Phase 0: Overview and Alignment Scope

## Status

- Status: Not Started
- Owner:
- Dependencies: none
- Updated: 2026-02-24

## Objective

Align the current modular Flutter codebase with `requirement.txt` using a Firebase-first implementation, while preserving future migration paths to API endpoints.

## Current Verified State

- `flutter analyze` passes
- `dart run melos run lint` passes
- App launches via `./scripts/run.sh`
- `flutter test` / `melos test` fail because `test/` directories are missing
- Dashboard and Reports are placeholders
- Transactions do not yet support image attachments or voice notes

## In Scope

- Firestore/Firebase Storage based implementation for:
  - transaction image attachments
  - voice-to-text note capture
  - dashboard metrics + trend chart
  - reports filtering + analytics + PDF/Excel export
- Additive schema migration
- Migration-friendly network/data abstraction
- Test scaffolding and validation workflow

## Out Of Scope

- Rust API endpoint integration
- Dio/Retrofit implementation
- Audio recording file storage
- Full data backfill/migration scripts unless necessary for compatibility

## Risks

- Firestore field inconsistency across existing docs
- Firebase Storage security rules blocking uploads
- Platform-specific speech-to-text support/permissions
- PDF/Excel export differences on web vs mobile

## Acceptance Criteria

- All scoped features have a documented phase plan with implementation steps and tests
- No phase leaves core technical decisions unspecified

