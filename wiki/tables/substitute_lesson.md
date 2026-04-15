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
row_estimate: 3841
columns_count: 7
relations_out: 3
relations_in: 0
---

# substitute_lesson

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `lesson_id` | `int` | NO |  |  |
| 3 | `original_teacher_id` | `int` | NO |  |  |
| 4 | `substitute_teacher_id` | `int` | NO |  |  |
| 5 | `reason` | `varchar(255)` | YES | NULL |  |
| 6 | `created_at` | `datetime` | YES | NULL |  |
| 7 | `updated_at` | `datetime` | YES | NULL |  |

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `lesson_id` | UNIQUE | `lesson_id` |
| `fi_substitute_lesson_ibfk1` | INDEX | `lesson_id` |
| `fi_substitute_lesson_ibfk2` | INDEX | `original_teacher_id` |
| `fi_substitute_lesson_ibfk3` | INDEX | `substitute_teacher_id` |

## Relations

### References (outbound)

- `lesson_id` → [[lesson]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `original_teacher_id` → [[teacher]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `substitute_teacher_id` → [[teacher]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

## See also

- [[lesson]]
- [[teacher]]
