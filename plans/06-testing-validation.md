# Phase 6: Testing and Validation

## Status

- Status: Not Started
- Owner:
- Dependencies: all implemented feature phases
- Updated: 2026-02-24

## Objective

Add test scaffolding and validate end-to-end behavior for the Firebase-first alignment work.

## Test Folder Scaffolding

Create missing `test/` directories (and minimal smoke tests) so `melos test` can run:

- `packages/app/test/`
- `packages/auth/test/`
- `packages/core/test/`
- `packages/customer/test/`
- `packages/shared/test/`
- `packages/transaction/test/`

## Automated Checks

- `flutter analyze`
- `dart run melos run lint`
- `dart run melos run test`

## Unit Tests (Minimum)

- Transaction entity/DTO mapping with new fields
- Firestore compatibility (missing optional fields)
- Attachment upload service success/failure mapping
- Dashboard metric calculations
- Report analytics calculations
- Query spec translation (if implemented)

## Widget Tests (Minimum)

- Transaction form with image attach + speech transcript UI
- Dashboard page states (loading/error/data)
- Reports page states + export button enabled flow

## Manual Smoke Checklist

- Run `./scripts/run.sh`
- Login/auth flow loads app
- Create transaction without attachment/voice
- Create transaction with image attachment
- Capture voice transcript and save
- Dashboard updates totals/trend
- Reports filter works
- PDF export works
- Excel export works

## Exit Criteria

- All analyzer/lint checks pass
- Tests run via Melos
- No regressions in app launch
- Core new user flows function manually

