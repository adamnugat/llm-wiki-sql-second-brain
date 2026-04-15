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
row_estimate: 4821
columns_count: 8
relations_out: 4
relations_in: 0
---

# student_award

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `student_id` | `int` | NO |  |  |
| 3 | `award_id` | `int` | NO |  |  |
| 4 | `awarded_by_teacher_id` | `int` | YES | NULL |  |
| 5 | `school_year_id` | `int` | YES | NULL |  |
| 6 | `awarded_date` | `date` | NO |  |  |
| 7 | `notes` | `varchar(255)` | YES | NULL |  |
| 8 | `created_at` | `datetime` | YES | NULL |  |

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_student_award_ibfk1` | INDEX | `student_id` |
| `fi_student_award_ibfk2` | INDEX | `award_id` |
| `fi_student_award_ibfk3` | INDEX | `awarded_by_teacher_id` |
| `fi_student_award_ibfk4` | INDEX | `school_year_id` |

## Relations

### References (outbound)

- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `award_id` → [[award]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `awarded_by_teacher_id` → [[teacher]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*
- `school_year_id` → [[school_year]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

## See also

- [[award]]
- [[school_year]]
- [[student]]
- [[teacher]]
