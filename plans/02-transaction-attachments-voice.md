# Phase 2: Transaction Attachments and Voice Notes

## Status

- Status: Not Started
- Owner:
- Dependencies: `01-foundation-schema.md`, `01b-network-abstraction-migration-ready.md`
- Updated: 2026-02-24

## Objective

Add transaction image/bill attachments (Firebase Storage) and speech-to-text note capture in the transaction form flow.

## User-Facing Scope

- Attach image from device (gallery first, camera optional)
- Upload image to Firebase Storage during create/update transaction
- Save image URL + metadata in Firestore transaction doc
- Voice note button to transcribe speech into text
- Transcript stored in transaction record and optionally appended to notes

## Files Impacted (Planned)

- `packages/transaction/lib/presentation/widgets/transaction_form_dialog.dart`
- `packages/transaction/lib/data/...` (attachment store, repository wiring)
- `packages/transaction/lib/domain/entities/transaction_entity.dart`
- `packages/transaction/lib/data/models/transaction_dto.dart`

## UI/State Changes

Add form state for:

- selected image (local file/xfile)
- upload state
- speech-to-text state (`idle`, `listening`, `processing`, `error`)
- transcript preview text

## Submit Flow (Decision Complete)

1. Validate form
2. Create/resolve transaction ID
3. If image selected, upload via `TransactionAttachmentStorePort`
4. Build entity with attachment URL + voice transcript fields
5. Dispatch create/update bloc event
6. Close dialog on success (or current behavior if bloc success flow owns it)

## Error Handling

- Upload failure: show message, keep dialog open
- Speech permission denied: show non-blocking error, allow manual note entry
- Transcription failure: preserve manual notes, no hard failure

## Acceptance Criteria

- Transaction can be created without image/voice
- Transaction can be created with image and stored URL
- Voice transcript can be captured and saved
- Existing transactions load without new fields

## Tests

- Widget test for image attach UI state
- Widget test for voice transcription flow (mock speech service)
- Unit test for upload service error mapping

