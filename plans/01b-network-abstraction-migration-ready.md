# Phase 1B: Migration-Friendly Network Layer (Firebase Now, API Later)

## Status

- Status: Not Started
- Owner:
- Dependencies: `01-foundation-schema.md`
- Updated: 2026-02-24

## Objective

Refactor the remote data boundary so Firebase remains the active backend, but future migration to API endpoints can be done by implementing ports and switching configuration rather than rewriting repositories/UI.

## Design Rules

1. Repositories must not depend directly on Firebase or future API SDK types.
2. Remote operations flow through backend-agnostic ports.
3. Backend-specific mapping is isolated in backend adapters.
4. Query/filtering should use shared query spec models.

## Planned Additions

### Backend mode config

- `packages/shared/lib/config/backend_mode.dart`
- `packages/shared/lib/config/backend_config.dart`

Provide:
- `enum BackendMode { firestore, api }`
- parser from `--dart-define`
- default mode = `firestore`

### Transaction remote ports

- `TransactionRemoteStorePort`
- `TransactionAttachmentStorePort`

Ports should use domain entities or canonical remote models only.

### Firestore implementations

- Explicit Firestore remote store implementation
- Firebase Storage attachment store implementation

### Future API stubs (optional scaffolds)

- API remote store implementation file(s)
- API mappers file(s)
- Can remain unimplemented in this pass

## Canonical Remote Model Strategy

Introduce a canonical transport model (e.g., `TransactionRemoteModel`) and isolate conversions:

- `TransactionEntity <-> TransactionRemoteModel`
- `TransactionRemoteModel <-> Firestore map`
- `TransactionRemoteModel <-> API JSON` (future)

This prevents Firestore `Timestamp` and API JSON differences from leaking upward.

## Query Specification

Define a shared query object for transaction filters:

- date range
- customer ID
- status
- type
- min/max amount
- sort/paging placeholders (optional)

Adapters translate the query object to Firestore queries now, API params later.

## DI Refactor Plan

Register backend mode and port implementations in DI:

- Firestore mode => Firestore ports
- API mode => API ports (future)

Repositories should depend on ports, not SDKs.

## Acceptance Criteria

- Remote boundary is backend-agnostic
- Firestore remains default and working
- Future API implementation can be added with minimal repository changes

## Tests

- Port contract tests (shared expectations)
- Mapper tests (Firestore/canonical)
- Backend mode config parser tests

