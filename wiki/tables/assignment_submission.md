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
row_estimate: 1238947
columns_count: 11
relations_out: 2
relations_in: 0
---

# assignment_submission

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `assignment_id` | `int` | NO |  |  |
| 3 | `student_id` | `int` | NO |  |  |
| 4 | `submitted_at` | `datetime` | YES | NULL |  |
| 5 | `score` | `decimal(6,2)` | YES | NULL |  |
| 6 | `feedback` | `text` | YES | NULL |  |
| 7 | `status` | `enum('pending','submitted','late','graded','returned','missing')` | NO | 'pending' |  |
| 8 | `file_path` | `varchar(512)` | YES | NULL |  |
| 9 | `graded_at` | `datetime` | YES | NULL |  |
| 10 | `created_at` | `datetime` | YES | NULL |  |
| 11 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`status`:** `pending`, `submitted`, `late`, `graded`, `returned`, `missing`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `assignment_id_student_id` | UNIQUE | `assignment_id`, `student_id` |
| `fi_assignment_submission_ibfk1` | INDEX | `assignment_id` |
| `fi_assignment_submission_ibfk2` | INDEX | `student_id` |
| `idx_submission_status` | INDEX | `status` |

## Relations

### References (outbound)

- `assignment_id` → [[assignment]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

## See also

- [[assignment]]
- [[student]]
