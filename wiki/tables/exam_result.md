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
row_estimate: 287431
columns_count: 11
relations_out: 3
relations_in: 0
---

# exam_result

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `exam_id` | `int` | NO |  |  |
| 3 | `student_id` | `int` | NO |  |  |
| 4 | `score` | `decimal(6,2)` | YES | NULL |  |
| 5 | `grade` | `decimal(4,2)` | YES | NULL |  |
| 6 | `attendance_status` | `enum('present','absent','excused')` | NO | 'present' |  |
| 7 | `feedback` | `text` | YES | NULL |  |
| 8 | `graded_by_teacher_id` | `int` | YES | NULL |  |
| 9 | `graded_at` | `datetime` | YES | NULL |  |
| 10 | `created_at` | `datetime` | YES | NULL |  |
| 11 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`attendance_status`:** `present`, `absent`, `excused`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `exam_id_student_id` | UNIQUE | `exam_id`, `student_id` |
| `fi_exam_result_ibfk1` | INDEX | `exam_id` |
| `fi_exam_result_ibfk2` | INDEX | `student_id` |
| `fi_exam_result_ibfk3` | INDEX | `graded_by_teacher_id` |

## Relations

### References (outbound)

- `exam_id` → [[exam]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `graded_by_teacher_id` → [[teacher]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*

## See also

- [[exam]]
- [[student]]
- [[teacher]]
