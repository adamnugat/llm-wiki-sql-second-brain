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
row_estimate: 184231
columns_count: 11
relations_out: 4
relations_in: 0
---

# final_grade

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
| 6 | `value` | `decimal(4,2)` | NO |  |  |
| 7 | `grade_type` | `enum('semester','annual','predicted','certificate')` | NO | 'semester' |  |
| 8 | `is_approved` | `tinyint(1)` | NO | '0' |  |
| 9 | `approved_at` | `datetime` | YES | NULL |  |
| 10 | `created_at` | `datetime` | YES | NULL |  |
| 11 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`grade_type`:** `semester`, `annual`, `predicted`, `certificate`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `student_id_subject_id_semester_id_grade_type` | UNIQUE | `student_id`, `subject_id`, `semester_id`, `grade_type` |
| `fi_final_grade_ibfk1` | INDEX | `student_id` |
| `fi_final_grade_ibfk2` | INDEX | `subject_id` |
| `fi_final_grade_ibfk3` | INDEX | `teacher_id` |
| `fi_final_grade_ibfk4` | INDEX | `semester_id` |

## Relations

### References (outbound)

- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `subject_id` → [[subject]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `teacher_id` → [[teacher]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `semester_id` → [[semester]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

## See also

- [[semester]]
- [[student]]
- [[subject]]
- [[teacher]]
