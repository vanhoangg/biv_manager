# Phase 3: Dashboard Metrics and Debt Trend Chart

## Status

- Status: Not Started
- Owner:
- Dependencies: `01-foundation-schema.md`
- Updated: 2026-02-24

## Objective

Replace the placeholder dashboard with debt summary metrics and a trend chart based on transaction data.

## Features

- Total debt
- Total paid
- Remaining debt
- Debt change over time chart

## Metric Rules (Defaults)

- `expense` transactions increase debt
- `income` transactions increase paid/recovery
- Exclude `cancelled` from calculations
- `remaining = totalDebt - totalPaid`

## Planned Additions

- Dashboard summary use case/service
- Trend aggregation use case/service (monthly buckets for MVP)
- Chart widget integration (`syncfusion_flutter_charts`)

## Files Impacted (Planned)

- `lib/presentation/pages/dashboard/dashboard_page.dart`
- New dashboard domain/service files under `lib/domain` and/or `lib/data`

## UI States

- loading
- empty (no transactions)
- error
- data-ready

## Acceptance Criteria

- Dashboard renders non-placeholder UI
- Summary values are computed from repository data
- Trend chart renders with sample and real data
- No analyzer/lint regressions

## Tests

- Unit tests for metric calculations
- Unit tests for trend aggregation
- Widget tests for dashboard state rendering

