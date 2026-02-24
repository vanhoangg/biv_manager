# Phase 4: Reports, Analytics, and PDF/Excel Export

## Status

- Status: Not Started
- Owner:
- Dependencies: `01-foundation-schema.md`, `01b-network-abstraction-migration-ready.md`, `03-dashboard-metrics-chart.md`
- Updated: 2026-02-24

## Objective

Replace the placeholder reports page with filtered analytics and export to PDF/Excel.

## Required Features (Chosen Scope)

- Filters:
  - date range
  - customer
  - transaction status
  - transaction type
  - amount range
- Analytics:
  - top 5 customers with highest debt
  - monthly recovery rate
  - debt summary grouped by customer type
  - location grouping only if schema/data supports it
- Export:
  - PDF
  - Excel

## Planned Contracts

- `ReportFilter`
- `DebtSummaryReport`
- `TopDebtorsItem`
- `MonthlyRecoveryItem`
- `ReportExportFormat`

## Files Impacted (Planned)

- `lib/presentation/pages/reports/reports_page.dart`
- New report calculation services/use cases
- New export services for PDF and Excel

## Data Flow

UI Filter -> Query Spec / ReportFilter -> Repository -> Aggregator -> View Models -> Export Services

## Export Behavior

- Generate filtered export from in-memory report dataset
- Web/mobile file handling can differ behind export service interface

## Acceptance Criteria

- Reports page is no longer placeholder
- Filters affect displayed analytics
- PDF export generates a file/blob
- Excel export generates a file/blob

## Tests

- Unit tests for filter application
- Unit tests for top-5 and monthly recovery calculations
- Unit tests for export service output generation (at least smoke/byte non-empty)
- Widget tests for report page states and filter UI

