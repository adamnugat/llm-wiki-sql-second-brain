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
row_estimate: 52918
columns_count: 8
relations_out: 3
relations_in: 0
---

# enrollment

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `student_id` | `int` | NO |  |  |
| 3 | `class_group_id` | `int` | NO |  |  |
| 4 | `school_year_id` | `int` | NO |  |  |
| 5 | `enrollment_date` | `date` | NO |  |  |
| 6 | `status` | `enum('active','transferred','withdrawn','completed')` | NO | 'active' |  |
| 7 | `created_at` | `datetime` | YES | NULL |  |
| 8 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`status`:** `active`, `transferred`, `withdrawn`, `completed`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `student_id_class_group_id_school_year_id` | UNIQUE | `student_id`, `class_group_id`, `school_year_id` |
| `fi_enrollment_ibfk1` | INDEX | `student_id` |
| `fi_enrollment_ibfk2` | INDEX | `class_group_id` |
| `fi_enrollment_ibfk3` | INDEX | `school_year_id` |

## Relations

### References (outbound)

- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `class_group_id` → [[class_group]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `school_year_id` → [[school_year]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

## See also

- [[class_group]]
- [[school_year]]
- [[student]]
