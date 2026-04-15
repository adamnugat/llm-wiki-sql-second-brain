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
row_estimate: 847321
columns_count: 8
relations_out: 4
relations_in: 0
---

# message_recipient

## Description

*Purpose and business context to be documented.*

## Columns

| # | Column | Type | Nullable | Default | Extra |
|---|--------|------|----------|---------|-------|
| 1 | `id` | `int` | NO |  | PK, AUTO_INCREMENT |
| 2 | `message_id` | `int` | NO |  |  |
| 3 | `student_id` | `int` | YES | NULL |  |
| 4 | `parent_id` | `int` | YES | NULL |  |
| 5 | `teacher_id` | `int` | YES | NULL |  |
| 6 | `is_read` | `tinyint(1)` | NO | '0' |  |
| 7 | `read_at` | `datetime` | YES | NULL |  |
| 8 | `created_at` | `datetime` | YES | NULL |  |

## Indexes

| Name | Type | Columns |
|------|------|---------|
| `PRIMARY` | PRIMARY | `id` |
| `fi_message_recipient_ibfk1` | INDEX | `message_id` |
| `fi_message_recipient_ibfk2` | INDEX | `student_id` |
| `fi_message_recipient_ibfk3` | INDEX | `parent_id` |
| `fi_message_recipient_ibfk4` | INDEX | `teacher_id` |
| `idx_message_recipient_is_read` | INDEX | `is_read` |

## Relations

### References (outbound)

- `message_id` → [[message]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `student_id` → [[student]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `parent_id` → [[parent]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*
- `teacher_id` → [[teacher]].`id` *(ON DELETE CASCADE, ON UPDATE CASCADE)*

## See also

- [[message]]
- [[parent]]
- [[student]]
- [[teacher]]
