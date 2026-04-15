---
type: entity
subtype: database-table
created: 2026-04-15
updated: 2026-04-15
sources: ["[[schema-dump]]"]
tags: [database]
engine: InnoDB
charset: utf8mb4
collation: utf8mb4_0900_ai_ci
row_estimate: 284
columns_count: 8
relations_out: 1
relations_in: 0
---

# holiday

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `school_year_id` | `int` | NO |  |  |
| 3 | `name` | `varchar(150)` | NO |  |  |
| 4 | `start_date` | `date` | NO |  |  |
| 5 | `end_date` | `date` | NO |  |  |
| 6 | `type` | `enum('public','school','exam_break','other')` | NO | 'public' |  |
| 7 | `created_at` | `datetime` | YES | NULL |  |
| 8 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`type`:** `public`, `school`, `exam_break`, `other`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_holiday_ibfk1` | INDEX | `school_year_id` |
| `idx_holiday_dates` | INDEX | `start_date`, `end_date` |

## Relations

### References (outbound)

- `school_year_id` → [[school_year]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

## See also

- [[school_year]]
