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
row_estimate: 12
columns_count: 7
relations_out: 0
relations_in: 10
---

# school_year

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `name` | `varchar(50)` | NO |  |  |
| 3 | `start_date` | `date` | NO |  |  |
| 4 | `end_date` | `date` | NO |  |  |
| 5 | `is_current` | `tinyint(1)` | NO | '0' |  |
| 6 | `created_at` | `datetime` | YES | NULL |  |
| 7 | `updated_at` | `datetime` | YES | NULL |  |

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `name` | UNIQUE | `name` |

## Relations

### Referenced by (inbound)

- [[semester]].`school_year_id` → `id`
- [[class_group]].`school_year_id` → `id`
- [[enrollment]].`school_year_id` → `id`
- [[subject_teacher]].`school_year_id` → `id`
- [[curriculum]].`school_year_id` → `id`
- [[holiday]].`school_year_id` → `id`
- [[event]].`school_year_id` → `id`
- [[club_membership]].`school_year_id` → `id`
- [[student_scholarship]].`school_year_id` → `id`
- [[student_award]].`school_year_id` → `id`

## See also

- [[class_group]]
- [[club_membership]]
- [[curriculum]]
- [[enrollment]]
- [[event]]
- [[holiday]]
- [[semester]]
- [[student_award]]
- [[student_scholarship]]
- [[subject_teacher]]
