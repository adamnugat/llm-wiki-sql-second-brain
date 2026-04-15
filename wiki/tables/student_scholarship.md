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
row_estimate: 1847
columns_count: 10
relations_out: 3
relations_in: 0
---

# student_scholarship

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `student_id` | `int` | NO |  |  |
| 3 | `scholarship_id` | `int` | NO |  |  |
| 4 | `school_year_id` | `int` | NO |  |  |
| 5 | `amount_awarded` | `decimal(10,2)` | YES | NULL |  |
| 6 | `awarded_date` | `date` | YES | NULL |  |
| 7 | `status` | `enum('active','expired','revoked')` | NO | 'active' |  |
| 8 | `notes` | `varchar(255)` | YES | NULL |  |
| 9 | `created_at` | `datetime` | YES | NULL |  |
| 10 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`status`:** `active`, `expired`, `revoked`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_student_scholarship_ibfk1` | INDEX | `student_id` |
| `fi_student_scholarship_ibfk2` | INDEX | `scholarship_id` |
| `fi_student_scholarship_ibfk3` | INDEX | `school_year_id` |

## Relations

### References (outbound)

- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `scholarship_id` → [[scholarship]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `school_year_id` → [[school_year]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

## See also

- [[scholarship]]
- [[school_year]]
- [[student]]
