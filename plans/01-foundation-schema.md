# Phase 1: Foundation and Additive Schema Migration

## Status

- Status: Not Started
- Owner:
- Dependencies: `00-overview.md`, `decisions.md`
- Updated: 2026-02-24

## Objective

Prepare the data model, Firebase integrations, and dependency injection for attachments/voice/report features using backward-compatible schema additions.

## Files Impacted (Planned)

- `packages/transaction/pubspec.yaml`
- `packages/transaction/lib/domain/entities/transaction_entity.dart`
- `packages/transaction/lib/data/models/transaction_dto.dart`
- `packages/transaction/lib/data/repositories/transaction_repository_impl.dart`
- `packages/transaction/lib/data/datasources/transaction/transaction_remote_data_source.dart`
- `lib/core/di/injection_container.dart`
- Optional: customer entity/DTO files if location analytics schema starts here

## Schema Changes (Additive)

### `TransactionEntity` / `TransactionDTO` optional fields

- `attachmentImageUrl`
- `attachmentFileName`
- `voiceTranscript`
- `voiceTranscribedAt`

Optional UI-only transient state (not persisted in domain model unless needed):
- local selected image path / `XFile`

## Compatibility Rules

- Reads must tolerate missing keys
- Firestore timestamp parsing must allow `null`
- Writes should include optional fields only when present

## Firebase Storage Foundation

Add Firebase Storage dependency and a storage service abstraction for transaction attachments.

### Storage path convention

- `transactions/{transactionId}/attachments/{timestamp}_{sanitizedFileName}`

## DI Changes (Planned)

Register:

- Firebase Storage instance
- Attachment storage service
- Any report/data calculator services introduced later

## Firebase CLI Discovery (Read-Only)

Use CLI/console to validate project and collections before implementation:

- confirm active Firebase project (`biv-manager`)
- inspect existing `transactions` and `customers` document shapes
- verify Storage rules and buckets

Note: Firestore has no strict schema; discovery is sampling + defensive parsing.

## Acceptance Criteria

- Data model changes are backward-compatible
- DI can resolve new storage abstraction
- Existing transaction documents remain readable
- No feature UI changes in this phase yet

## Tests

- DTO/entity round-trip with and without new optional fields
- Null/missing field deserialization tests

