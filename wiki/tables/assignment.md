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
row_estimate: 87432
columns_count: 13
relations_out: 4
relations_in: 1
---

# assignment

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `lesson_id` | `int` | YES | NULL |  |
| 3 | `subject_id` | `int` | NO |  |  |
| 4 | `teacher_id` | `int` | NO |  |  |
| 5 | `class_group_id` | `int` | NO |  |  |
| 6 | `title` | `varchar(255)` | NO |  |  |
| 7 | `description` | `text` | YES | NULL |  |
| 8 | `due_date` | `datetime` | NO |  |  |
| 9 | `max_score` | `decimal(6,2)` | NO | '100.00' |  |
| 10 | `type` | `enum('homework','project','essay','presentation','lab_report','other')` | NO | 'homework' |  |
| 11 | `is_graded` | `tinyint(1)` | NO | '1' |  |
| 12 | `created_at` | `datetime` | YES | NULL |  |
| 13 | `updated_at` | `datetime` | YES | NULL |  |

## Enum Values

**`type`:** `homework`, `project`, `essay`, `presentation`, `lab_report`, `other`

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_assignment_ibfk1` | INDEX | `lesson_id` |
| `fi_assignment_ibfk2` | INDEX | `subject_id` |
| `fi_assignment_ibfk3` | INDEX | `teacher_id` |
| `fi_assignment_ibfk4` | INDEX | `class_group_id` |
| `idx_assignment_due_date` | INDEX | `due_date` |

## Relations

### References (outbound)

- `lesson_id` → [[lesson]].`id` *(ON DELETE SET NULL, ON UPDATE CASCADE)*
- `subject_id` → [[subject]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `teacher_id` → [[teacher]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `class_group_id` → [[class_group]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

### Referenced by (inbound)

- [[assignment_submission]].`assignment_id` → `id`

## See also

- [[assignment_submission]]
- [[class_group]]
- [[lesson]]
- [[subject]]
- [[teacher]]
