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
row_estimate: 4817293
columns_count: 9
relations_out: 3
relations_in: 0
---

# lesson_attendance

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `lesson_id` | `int` | NO |  |  |
| 3 | `student_id` | `int` | NO |  |  |
| 4 | `status` | `enum('present','absent','late','excused','remote')` | NO | 'present' |  |
| 5 | `late_minutes` | `tinyint` | YES | NULL |  |
| 6 | `excuse_reason` | `varchar(255)` | YES | NULL |  |
| 7 | `noted_by_teacher_id` | `int` | YES | NULL |  |
| 8 | `created_at` | `datetime` | YES | NULL |  |
| 9 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`status`:** `present`, `absent`, `late`, `excused`, `remote`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `lesson_id_student_id` | UNIQUE | `lesson_id`, `student_id` |
| `fi_lesson_attendance_ibfk1` | INDEX | `lesson_id` |
| `fi_lesson_attendance_ibfk2` | INDEX | `student_id` |
| `fi_lesson_attendance_ibfk3` | INDEX | `noted_by_teacher_id` |
| `idx_attendance_status` | INDEX | `status` |

## Relations

### References (outbound)

- `lesson_id` → [[lesson]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `noted_by_teacher_id` → [[teacher]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

## See also

- [[lesson]]
- [[student]]
- [[teacher]]
