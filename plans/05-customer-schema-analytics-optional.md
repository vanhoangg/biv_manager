# Phase 5 (Optional): Customer Schema Expansion for Better Analytics

## Status

- Status: Optional
- Owner:
- Dependencies: `04-reports-filters-export.md`
- Updated: 2026-02-24

## Objective

Improve reporting quality (especially location/category grouping) by adding explicit customer metadata fields instead of relying on free-form address parsing.

## Proposed Additive Fields (Optional)

- `location`
- `city`
- `region`
- `country`
- `segment` (business category/customer segment)

## Why Optional

Current requirements can be partially satisfied using:

- `customer.type`
- `address` (limited parsing)

This phase becomes important if location-based analytics needs to be accurate and consistent.

## Compatibility Strategy

- Add optional fields only
- Preserve existing `address`
- Default missing values to `null`
- Report UI should gracefully show “unavailable / insufficient data” where applicable

## Acceptance Criteria

- Existing customer docs remain readable
- Reports can use explicit location/category fields when present
- No destructive migrations required

## Tests

- Customer entity/DTO backward compatibility tests
- Report grouping tests with and without location fields

