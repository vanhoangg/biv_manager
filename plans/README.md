# Biv Manager Alignment Plans

This folder contains a split implementation plan to align the codebase with `requirement.txt` while keeping Firebase (Firestore + Firebase Storage) as the active backend.

## How To Use

1. Read `00-overview.md` and `decisions.md` first.
2. Execute phases in order unless a phase is marked optional.
3. Update each phase file status as work progresses.
4. Validate with `flutter analyze`, `dart run melos run lint`, and `dart run melos run test`.

## Phase Order

1. `00-overview.md`
2. `01-foundation-schema.md`
3. `01b-network-abstraction-migration-ready.md`
4. `02-transaction-attachments-voice.md`
5. `03-dashboard-metrics-chart.md`
6. `04-reports-filters-export.md`
7. `05-customer-schema-analytics-optional.md` (optional)
8. `06-testing-validation.md`

## Status Tracker

| File | Scope | Status |
|---|---|---|
| `00-overview.md` | Program overview and constraints | Not Started |
| `01-foundation-schema.md` | Schema + Firebase foundations | Not Started |
| `01b-network-abstraction-migration-ready.md` | Migration-friendly data/remote abstraction | Not Started |
| `02-transaction-attachments-voice.md` | Image attachments + speech-to-text | Not Started |
| `03-dashboard-metrics-chart.md` | Dashboard metrics and chart | Not Started |
| `04-reports-filters-export.md` | Reports, analytics, PDF/Excel export | Not Started |
| `05-customer-schema-analytics-optional.md` | Optional customer schema expansion | Optional |
| `06-testing-validation.md` | Tests, smoke checks, validation | Not Started |

## Shared Decisions

See `decisions.md` for defaults (Firestore-first, Firebase Storage, speech-to-text transcript only, PDF+Excel exports, additive schema migration).

