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
row_estimate: 2847
columns_count: 6
relations_out: 2
relations_in: 0
---

# curriculum_subject

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `curriculum_id` | `int` | NO |  |  |
| 3 | `subject_id` | `int` | NO |  |  |
| 4 | `hours_per_week` | `tinyint` | NO | '1' |  |
| 5 | `is_mandatory` | `tinyint(1)` | NO | '1' |  |
| 6 | `created_at` | `datetime` | YES | NULL |  |

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `curriculum_id_subject_id` | UNIQUE | `curriculum_id`, `subject_id` |
| `fi_curriculum_subject_ibfk1` | INDEX | `curriculum_id` |
| `fi_curriculum_subject_ibfk2` | INDEX | `subject_id` |

## Relations

### References (outbound)

- `curriculum_id` → [[curriculum]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `subject_id` → [[subject]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

## See also

- [[curriculum]]
- [[subject]]
