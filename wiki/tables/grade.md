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
row_estimate: 1847362
columns_count: 13
relations_out: 6
relations_in: 0
---

# grade

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `student_id` | `int` | NO |  |  |
| 3 | `subject_id` | `int` | NO |  |  |
| 4 | `teacher_id` | `int` | NO |  |  |
| 5 | `semester_id` | `int` | NO |  |  |
| 6 | `grade_category_id` | `int` | YES | NULL |  |
| 7 | `lesson_id` | `int` | YES | NULL |  |
| 8 | `value` | `decimal(4,2)` | NO |  |  |
| 9 | `max_value` | `decimal(4,2)` | NO | '6.00' |  |
| 10 | `description` | `varchar(255)` | YES | NULL |  |
| 11 | `graded_at` | `datetime` | YES | NULL |  |
| 12 | `created_at` | `datetime` | YES | NULL |  |
| 13 | `updated_at` | `datetime` | YES | NULL |  |

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_grade_ibfk1` | INDEX | `student_id` |
| `fi_grade_ibfk2` | INDEX | `subject_id` |
| `fi_grade_ibfk3` | INDEX | `teacher_id` |
| `fi_grade_ibfk4` | INDEX | `semester_id` |
| `fi_grade_ibfk5` | INDEX | `grade_category_id` |
| `fi_grade_ibfk6` | INDEX | `lesson_id` |
| `idx_grade_value` | INDEX | `value` |

## Relations

### References (outbound)

- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `subject_id` → [[subject]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `teacher_id` → [[teacher]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `semester_id` → [[semester]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `grade_category_id` → [[grade_category]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*
- `lesson_id` → [[lesson]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

## See also

- [[grade_category]]
- [[lesson]]
- [[semester]]
- [[student]]
- [[subject]]
- [[teacher]]
