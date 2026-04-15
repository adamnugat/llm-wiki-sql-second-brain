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
row_estimate: 1843
columns_count: 6
relations_out: 3
relations_in: 0
---

# subject_teacher

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `teacher_id` | `int` | NO |  |  |
| 3 | `subject_id` | `int` | NO |  |  |
| 4 | `school_year_id` | `int` | NO |  |  |
| 5 | `is_primary` | `tinyint(1)` | NO | '1' |  |
| 6 | `created_at` | `datetime` | YES | NULL |  |

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `teacher_id_subject_id_school_year_id` | UNIQUE | `teacher_id`, `subject_id`, `school_year_id` |
| `fi_subject_teacher_ibfk1` | INDEX | `teacher_id` |
| `fi_subject_teacher_ibfk2` | INDEX | `subject_id` |
| `fi_subject_teacher_ibfk3` | INDEX | `school_year_id` |

## Relations

### References (outbound)

- `teacher_id` → [[teacher]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `subject_id` → [[subject]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `school_year_id` → [[school_year]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

## See also

- [[school_year]]
- [[subject]]
- [[teacher]]
